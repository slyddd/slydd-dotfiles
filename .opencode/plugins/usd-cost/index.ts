/**
 * opencode-usd-cost — server entrypoint
 *
 * The plugin only renders terminal UI, so this entrypoint is intentionally a
 * no-op. It exists so V2 plugin discovery finds the package layout
 * `usd-cost/index.ts` (server) + `usd-cost/tui.tsx` (TUI).
 *
 * The definition is a plain object (same shape `Plugin.define` returns) on
 * purpose: the background server loads local plugin files with module
 * resolution relative to `.opencode/`, where `@opencode/plugin` is not
 * installed. Keeping this entrypoint dependency-free avoids a failed load at
 * startup. The TUI entrypoint can import `@opencode/plugin/tui` because the
 * terminal client resolves that package at runtime.
 */
const plugin = {
  id: 'usd-cost.server',
  setup() {},
};

export default plugin;
