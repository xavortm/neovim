# Copilot Instructions for Neovim Config (alex)

## Project Purpose & Architecture

This is a modular Neovim configuration focused on speed, simplicity, and essential developer features. It is organized for personal use, with all logic and plugin management under `lua/alex/`.

**Key architectural patterns:**

- **Single entrypoint:** `init.lua` loads everything via `lua/alex/init.lua`.
- **Plugin management:** Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin loading, configured in `lua/alex/lazy/`.
- **Feature separation:** Each plugin or feature (LSP, git, completion, etc.) has its own config file in `lua/alex/lazy/`.
- **Minimal global state:** Most settings are local to their config files; globals are avoided.

## Directory Structure

- `/init.lua` – Entrypoint, loads user config
- `/lua/alex/` – All user config (autocmds, remaps, settings, plugin loader)
- `/lua/alex/lazy/` – One file per plugin/feature (e.g. `gitsigns.lua`, `lsp.lua`, `telescope.lua`)

## Developer Workflows

- **Reload config:** Restart Neovim or use `:source %` on edited Lua files
- **Plugin sync/update:** `:Lazy sync` or `:Lazy update`
- **Debugging:** Use `:messages` for errors; check plugin-specific logs if needed
- **No build/test scripts:** This is a config repo, not an app/library

## Project Conventions

- **Lua only:** All config is in Lua, not Vimscript
- **Commenting:** Add simple comments to clarify non-obvious logic
- **Linting:** Ignore unused/undefined variable warnings (see `README.md`)
- **Plugin config pattern:**
  - Each plugin gets its own file in `lua/alex/lazy/`
  - Use `require("alex.lazy.<plugin>")` to load
  - Example: `lua/alex/lazy/gitsigns.lua` sets up git integration

## Integration Points

- **LSP:** Configured in `lua/alex/lazy/lsp.lua` and related files
- **Completion/snippets:** `luasnip.lua`, `blink.cmp.lua`
- **Git:** `gitsigns.lua`, `neogit.lua`, `git-conflict.lua`
- **Fuzzy finding:** `telescope.lua`, `harpoon.lua`
- **Other:** See `lua/alex/lazy/` for all enabled features

## Examples

- To add a new plugin: create a new file in `lua/alex/lazy/`, then add it to the loader in `lua/alex/lazy_init.lua`
- To change LSP settings: edit `lua/alex/lazy/lsp.lua`

---

**For AI agents:**

- Focus on modular, per-plugin config in `lua/alex/lazy/`
- Avoid global state; prefer local config
- Use Lua idioms and keep code simple/fast
