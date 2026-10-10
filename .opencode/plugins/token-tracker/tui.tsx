/**
 * token-tracker (OpenCode V2 CLI plugin)
 *
 * Ported from the V1 TUI plugin of the same name.
 *
 * Displays live token usage, request count, and cost in the sidebar footer.
 * Updates every 2 seconds during agent execution.
 *
 * Shows two lines:
 *   <clock> last: in: 70k · out: 1.2k · 3 reqs · $0.04
 *   <chart> total: in: 1.2m · out: 0.3m · 42 reqs · $1.23
 *
 * Icons are Nerd Font glyphs (Font Awesome range, private use area), never
 * emoji: terminal fonts render them monochrome and aligned with the text.
 */

/** @jsxImportSource @opentui/solid */
import { Plugin } from '@opencode/plugin/tui';

const REFRESH_MS = 2000;

// Nerd Font icons (Font Awesome codepoints)
const ICON_BUSY = '\uf017'; // nf-fa-clock_o
const ICON_IDLE = '\uf00c'; // nf-fa-check
const ICON_TOTAL = '\uf080'; // nf-fa-bar_chart

const formatTokens = (n) => {
  if (n >= 1_000_000) return `${(n / 1_000_000).toFixed(1)}m`;
  if (n >= 1_000) return `${(n / 1_000).toFixed(1)}k`;
  return `${n}`;
};

const formatCost = (n) => {
  if (n >= 1) return `$${n.toFixed(2)}`;
  if (n >= 0.01) return `$${n.toFixed(3)}`;
  return `$${n.toFixed(4)}`;
};

const plural = (count, singular, pluralForm) =>
  `${count} ${count === 1 ? singular : pluralForm}`;

export default Plugin.define({
  id: 'token-tracker.tui',
  setup(context) {
    const [state, update] = context.storage.memory('token-tracker', {
      initial: { tick: 0 },
    });

    let visibleSession;
    const synced = new Set();

    const timer = setInterval(() => {
      if (visibleSession) {
        void context.data.session.message.sync(visibleSession).catch(() => {});
      }
      update((draft) => {
        draft.tick += 1;
      });
    }, REFRESH_MS);

    context.ui.slot({
      append: 'sidebar.footer',
      render: (input) => {
        // Subscribe to the refresh tick so the footer stays live even when the
        // cached message list does not change between renders.
        void state.tick;
        const sessionID = input.sessionID;
        visibleSession = sessionID;
        if (!sessionID) return null;
        if (!synced.has(sessionID)) {
          synced.add(sessionID);
          void context.data.session.message.sync(sessionID).catch(() => {});
        }

        const isBusy = context.data.session.status(sessionID) === 'running';
        const messages = context.data.session.message.list(sessionID) ?? [];

        let totalInp = 0;
        let totalOut = 0;
        let totalCost = 0;
        let reqCount = 0;
        for (const message of messages) {
          if (message.type !== 'assistant' || !message.tokens) continue;
          totalInp += message.tokens.input || 0;
          totalOut += message.tokens.output || 0;
          totalCost += message.cost || 0;
          if (message.tokens.input > 0) reqCount += 1;
        }

        // Last request: latest assistant message that actually consumed input.
        let last;
        for (let i = messages.length - 1; i >= 0; i -= 1) {
          const message = messages[i];
          if (
            message.type === 'assistant' &&
            message.tokens &&
            message.tokens.input > 0
          ) {
            last = message;
            break;
          }
        }
        const lastInp = last?.tokens?.input ?? 0;
        const lastOut = last?.tokens?.output ?? 0;
        const lastCost = last?.cost ?? 0;

        // Requests made in the current turn (since the last user message), a
        // real count instead of the V1 hardcoded "1 req".
        let lastUserIndex = -1;
        for (let i = messages.length - 1; i >= 0; i -= 1) {
          if (messages[i].type === 'user') {
            lastUserIndex = i;
            break;
          }
        }
        let lastReq = 0;
        for (let i = lastUserIndex + 1; i < messages.length; i += 1) {
          const message = messages[i];
          if (message.type === 'assistant' && message.tokens?.input > 0) {
            lastReq += 1;
          }
        }

        const theme = context.theme;
        return (
          <box>
            <text>
              <span style={{ fg: theme.text.subdued }}>
                {isBusy ? ICON_BUSY : ICON_IDLE}
              </span>
              <span style={{ fg: theme.text.subdued }}> last: in: </span>
              <span style={{ fg: theme.text.default }}>
                {formatTokens(lastInp)}
              </span>
              <span style={{ fg: theme.text.subdued }}> · out: </span>
              <span style={{ fg: theme.text.default }}>
                {formatTokens(lastOut)}
              </span>
              <span style={{ fg: theme.text.subdued }}> · </span>
              <span style={{ fg: theme.text.default }}>
                {plural(lastReq, 'req', 'reqs')}
              </span>
              {lastCost > 0 ? (
                <>
                  <span style={{ fg: theme.text.subdued }}> · </span>
                  <span style={{ fg: theme.text.action.primary.default }}>
                    {formatCost(lastCost)}
                  </span>
                </>
              ) : null}
            </text>
            <text>
              <span style={{ fg: theme.text.subdued }}>{ICON_TOTAL}</span>
              <span style={{ fg: theme.text.subdued }}> total: in: </span>
              <span style={{ fg: theme.text.default }}>
                {formatTokens(totalInp)}
              </span>
              <span style={{ fg: theme.text.subdued }}> · out: </span>
              <span style={{ fg: theme.text.default }}>
                {formatTokens(totalOut)}
              </span>
              <span style={{ fg: theme.text.subdued }}> · </span>
              <span style={{ fg: theme.text.default }}>
                {plural(reqCount, 'req', 'reqs')}
              </span>
              {totalCost > 0 ? (
                <>
                  <span style={{ fg: theme.text.subdued }}> · </span>
                  <span style={{ fg: theme.text.action.primary.default }}>
                    {formatCost(totalCost)}
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
