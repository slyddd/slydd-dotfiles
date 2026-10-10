/**
 * opencode-usd-cost (OpenCode V2 CLI plugin)
 *
 * Ported from the V1 TUI plugin of the same name, adapted from
 * opencode-brl-cost (https://www.npmjs.com/package/opencode-brl-cost)
 * Copyright (C) 2025 oporpino — AGPL-3.0
 *
 * Changes: all costs and the OpenRouter balance are shown in USD. The daily
 * USD→BRL quote (AwesomeAPI), its cache and the BRL formatting were removed.
 *
 * Shows in the terminal:
 *   - home footer: remaining OpenRouter credits
 *   - prompt footer: day / week / month cost (+ projection), current session
 *     cost and the OpenRouter balance
 */

/** @jsxImportSource @opentui/solid */
import { Plugin } from '@opencode/plugin/tui';
import { readFileSync } from 'node:fs';
import { homedir } from 'node:os';
import { join } from 'node:path';

const OPENROUTER_CREDITS = 'https://openrouter.ai/api/v1/credits';
const REFRESH_MS = 2000;
const BALANCE_MS = 60000;

// Nerd Font icons (Font Awesome codepoints), never emoji
const ICON_CREDITS = '\uf155'; // nf-fa-dollar
const ICON_SESSION = '\uf120'; // nf-fa-terminal

const formatUSD = (value) =>
  new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
    minimumFractionDigits: 2,
    maximumFractionDigits: 4,
  }).format(value);

const startOfDay = (date) =>
  new Date(date.getFullYear(), date.getMonth(), date.getDate()).getTime();

const startOfWeek = (date) => {
  const current = new Date(date.getFullYear(), date.getMonth(), date.getDate());
  current.setDate(current.getDate() - ((current.getDay() + 6) % 7));
  return current.getTime();
};

const startOfMonth = (date) =>
  new Date(date.getFullYear(), date.getMonth(), 1).getTime();

const computeProjection = (month) => {
  const now = new Date();
  const daysInMonth = new Date(
    now.getFullYear(),
    now.getMonth() + 1,
    0,
  ).getDate();
  const completedDays = now.getDate() - 1;
  const remaining = daysInMonth - now.getDate();
  if (completedDays <= 0) return '';
  if (month <= 0) return '';
  if (remaining <= 0) return '';
  const average = month / completedDays;
  return formatUSD(month + average * remaining);
};

const readOpenRouterKey = () => {
  const dataHome = process.env.XDG_DATA_HOME
    ? process.env.XDG_DATA_HOME
    : join(homedir(), '.local', 'share');
  const configHome = process.env.XDG_CONFIG_HOME
    ? process.env.XDG_CONFIG_HOME
    : join(homedir(), '.config');
  const candidates = [
    join(dataHome, 'opencode', 'auth.json'),
    join(configHome, 'opencode', 'auth.json'),
  ];
  for (const file of candidates) {
    try {
      const parsed = JSON.parse(readFileSync(file, 'utf8'));
      const key = parsed['openrouter']?.key;
      if (typeof key === 'string' && key.length > 0) return key;
    } catch {
      // missing or invalid auth file, try the next candidate
    }
  }
  return undefined;
};

const fetchSaldo = async (key) => {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 15000);
  try {
    const res = await fetch(OPENROUTER_CREDITS, {
      headers: { Authorization: `Bearer ${key}` },
      signal: controller.signal,
    });
    if (!res.ok) return undefined;
    const body = await res.json();
    const data = body?.data;
    if (
      typeof data?.total_credits === 'number' &&
      typeof data?.total_usage === 'number'
    ) {
      return Math.max(0, data.total_credits - data.total_usage);
    }
    return undefined;
  } catch {
    // network error, hide the balance
    return undefined;
  } finally {
    clearTimeout(timeout);
  }
};

export default Plugin.define({
  id: 'usd-cost.tui',
  setup(context) {
    const openRouterKey = readOpenRouterKey();

    const [state, update] = context.storage.memory('usd-cost', {
      initial: {
        tick: 0,
        day: formatUSD(0),
        week: formatUSD(0),
        month: formatUSD(0),
        projection: '',
        balance: 0,
        hasBalance: false,
      },
    });

    const costs = new Map();
    const contributions = new Map();

    const assess = (info) => {
      if (
        !info ||
        typeof info.cost !== 'number' ||
        typeof info.time?.created !== 'number'
      )
        return;
      const existing = costs.get(info.id);
      const delta = info.cost - (existing?.cost ?? 0);
      const updated =
        typeof info.time?.updated === 'number'
          ? info.time.updated
          : info.time.created;
      costs.set(info.id, { cost: info.cost, updated });
      if (delta <= 0) return;
      const list = contributions.get(info.id) ?? [];
      list.push({ usd: delta, ts: updated });
      contributions.set(info.id, list);
    };

    const refresh = () => {
      const sessions = context.data.session.list();
      if (Array.isArray(sessions))
        sessions.forEach((session) => assess(session));
      const now = new Date();
      const dayStart = startOfDay(now);
      const weekStart = startOfWeek(now);
      const monthStart = startOfMonth(now);
      let day = 0;
      let week = 0;
      let month = 0;
      for (const list of contributions.values()) {
        for (const { usd, ts } of list) {
          if (ts >= dayStart) day += usd;
          if (ts >= weekStart) week += usd;
          if (ts >= monthStart) month += usd;
        }
      }
      const projection = computeProjection(month);
      update((draft) => {
        draft.tick += 1;
        draft.day = formatUSD(day);
        draft.week = formatUSD(week);
        draft.month = formatUSD(month);
        draft.projection = projection;
      });
    };

    const loadBalance = async () => {
      if (!openRouterKey) return;
      const value = await fetchSaldo(openRouterKey);
      update((draft) => {
        if (typeof value === 'number') {
          draft.balance = value;
          draft.hasBalance = true;
        } else {
          draft.hasBalance = false;
        }
      });
    };

    refresh();
    void loadBalance();
    let ticks = 0;
    const timer = setInterval(() => {
      refresh();
      ticks += 1;
      if (ticks % Math.round(BALANCE_MS / REFRESH_MS) === 0) {
        void loadBalance();
      }
    }, REFRESH_MS);

    context.ui.slot({
      append: 'home.footer.status',
      render: () => {
        if (!openRouterKey || !state.hasBalance) return null;
        return (
          <text>
            <span style={{ fg: context.theme.text.action.primary.default }}>
              {`${ICON_CREDITS} openrouter: `}
            </span>
            <span style={{ fg: context.theme.text.feedback.success.default }}>
              {formatUSD(state.balance)}
            </span>
          </text>
        );
      },
    });

    context.ui.slot({
      append: 'prompt.footer.status',
      render: (input) => {
        // Subscribe to the refresh tick so the session cost stays in sync even
        // when the aggregate values do not change between refreshes.
        void state.tick;
        const sessionID = input.sessionID;
        const entry = sessionID ? costs.get(sessionID) : undefined;
        const sessionCost = formatUSD(entry ? entry.cost : 0);
        return (
          <box flexDirection="row">
            <text>
              <span style={{ fg: context.theme.text.subdued }}>dia: </span>
              <span style={{ fg: context.theme.text.action.primary.default }}>
                {state.day}
              </span>
              <span style={{ fg: context.theme.text.subdued }}>
                {' | semana: '}
              </span>
              <span style={{ fg: context.theme.text.feedback.success.default }}>
                {state.week}
              </span>
              <span style={{ fg: context.theme.text.subdued }}>
                {' | mes: '}
              </span>
              <span style={{ fg: context.theme.text.feedback.warning.default }}>
                {state.month}
              </span>
              {state.projection ? (
                <>
                  <span
                    style={{ fg: context.theme.text.action.primary.default }}
                  >
                    {' → '}
                  </span>
                  <span
                    style={{ fg: context.theme.text.action.primary.default }}
                  >
                    {state.projection}
                  </span>
                </>
              ) : null}
              <span style={{ fg: context.theme.text.subdued }}>
                {` | session: `}
              </span>
              <span style={{ fg: context.theme.text.default }}>
                {sessionCost}
              </span>
              {openRouterKey && state.hasBalance ? (
                <>
                  <span
                    style={{ fg: context.theme.text.action.primary.default }}
                  >
                    {` | openrouter: `}
                  </span>
                  <span
                    style={{ fg: context.theme.text.feedback.success.default }}
                  >
                    {formatUSD(state.balance)}
                  </span>
                </>
              ) : null}
            </text>
          </box>
        );
      },
    });

    return () => clearInterval(timer);
  },
});
