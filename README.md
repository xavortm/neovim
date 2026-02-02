# Neovim Configuration

My personal Neovim configuration for Neovim 0.11+.

![Work in progress](https://img.shields.io/badge/work_in_progress-blue)

<img width="2564" height="1356" alt="image" src="https://github.com/user-attachments/assets/81acbfc0-f605-4070-b22e-08a147a870d1" />

---

## Features

- **Simple & Minimal**: Close to vanilla Neovim, easy to understand and extend.
- **Native LSP Completion**: Uses Neovim 0.11's built-in completion with `luasnip` for snippets.
- **LSP Support**: Language servers managed with `mason`.
- **Git Integration**: Seamless workflow with `gitsigns` and `neogit`.
- **Fuzzy Finding**: Quick searching with `telescope`.
- **Moonfly Theme**: A beautiful, modern theme.

## Requirements

- **Neovim 0.11+** ([Install](https://github.com/neovim/neovim/releases))
- **git**, **curl** or **wget**
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** and **[fd](https://github.com/sharkdp/fd)**

## Installation

```bash
# Backup existing config (if needed)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repository
git clone https://github.com/xavortm/neovim.git ~/.config/nvim

# Start Neovim - plugins install automatically
nvim
```

## Keybindings

Keybindings are in [`lua/alex/remap.lua`](lua/alex/remap.lua). `which-key` provides popup hints.

| Keybinding      | Description                          |
| --------------- | ------------------------------------ |
| `<leader>e`     | Explore files                        |
| `<leader>p`     | Paste without losing yanked text     |
| `J` / `K` (vis) | Move selected lines up/down          |
| `gD` / `gd`     | Go to declaration/definition         |
| `<leader>ca`    | Code action                          |
| `<leader>cr`    | Code references                      |
| `<leader>cn`    | Code rename                          |
| `<leader>sr`    | Search and replace word under cursor |

### Harpoon

| Keybinding  | Description                  |
| ----------- | ---------------------------- |
| `<leader>a` | Add file to Harpoon list     |
| `<C-e>`     | Toggle Harpoon quick menu    |
| `<C-h/j/k/l>` | Navigate to marked file 1-4 |

## Plugins

See [`lua/alex/lazy`](lua/alex/lazy) for the full list. Key plugins include:

- **[Telescope](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finding
- **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting
- **[Mason](https://github.com/williamboman/mason.nvim)** - LSP installer
- **[Harpoon](https://github.com/ThePrimeagen/harpoon)** - File navigation
- **[Gitsigns](https://github.com/lewis6991/gitsigns.nvim)** / **[Neogit](https://github.com/TimUntersberger/neogit)** - Git integration

## WordPress Development

For WordPress/PHP development with `phpcs` and 10up standards:

```bash
# Install PHPCS and 10up standards
composer global require "squizlabs/php_codesniffer=*"
composer global require "10up/wp-phpcs:dev-master"
phpcs --config-set installed_paths ~/.composer/vendor/10up/wp-phpcs
```

For Intelephense license, create `~/intelephense/license.txt` with your key.

## Troubleshooting

- **LSP not working**: Check `:LspInfo` and ensure servers are installed
- **General issues**: Try `nvim --clean` or run `:checkhealth`
