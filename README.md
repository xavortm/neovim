# Neovim Configuration

My personal Neovim configuration.

[![CodeRabbit Pull Request Reviews](https://img.shields.io/coderabbit/prs/github/xavortm/neovim?utm_source=oss&utm_medium=github&utm_campaign=xavortm%2Fneovim&labelColor=171717&color=FF570A&link=https%3A%2F%2Fcoderabbit.ai&label=CodeRabbit+Reviews)](https://coderabbit.ai)
![Work in progress](https://img.shields.io/badge/work_in_progress-blue)

## ✨ Features

*   **Simple, non-rizzed experience**: I tried to keep it close to vanilla nvim.
*   **Fast & Lightweight**: Optimized for performance.
*   **Smart Completion**: Powered by `luasnip` and `cmp`.
*   **LSP Support**: Full-featured language server support with `mason` and `lsp.lua`.
*   **Git Integration**: Seamless git integration with `gitsigns`.
*   **Fuzzy Finding**: Quick file and text searching with `telescope`.
*   **And much more...**

## 🔌 Plugins

This configuration is built on top of a curated list of plugins, including:

*   **[Blink.nvim](https://github.com/xavortm/blink.nvim)**: Easy navigation between files.
*   **[Comment.nvim](https://github.com/numToStr/Comment.nvim)**: Smart commenting.
*   **[Gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Git decorations.
*   **[Harpoon](https://github.com/ThePrimeagen/harpoon)**: File marking and navigation.
*   **[LSP, Mason, Luasnip, etc.]**: The core of the modern Neovim experience.
*   **[Rose-pine](https://github.com/rose-pine/neovim)**: A beautiful, modern theme.
*   **[Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: Powerful fuzzy finding.
*   **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Advanced syntax highlighting and code parsing.
*   **[Which-key.nvim](https://github.com/folke/which-key.nvim)**: Keybinding hints.

... and others. Check out the `lua/alex/lazy` directory for the full list.

## 🚀 Installation

1.  Clone this repository to your Neovim configuration directory:
    ```bash
    git clone https://github.com/xavortm/neovim.git ~/.config/nvim
    ```
2.  Start Neovim:
    ```bash
    nvim
    ```
    The plugins will be installed automatically by `lazy.nvim`.

## ⌨️ Keybindings

The main keybindings are defined in `lua/alex/remap.lua`. I use `which-key.nvim` to display a popup with the available keybindings. Here are some of the most important ones:

| Keybinding      | Description                            |
| --------------- | -------------------------------------- |
| `<leader>e`     | Explore files                          |
| `<leader>p`     | Paste without losing the yanked text   |
| `J` / `K` (vis) | Move selected lines up/down            |
| `gD`            | Go to definition                       |
| `gd`            | Go to definition                       |
| `<leader>ca`    | Code action                            |
| `<leader>cr`    | Code references                        |
| `<leader>cn`    | Code rename                            |
| `<leader>sr`    | Search and replace word under cursor   |
| `<leader>cs`    | Search functions in workspace          |
| `<leader>df`    | Search functions in current document   |
| `<leader>ds`    | Search symbols in current document     |

### 📌 Harpoon Usage

Harpoon allows you to quickly mark files and jump between them.

| Keybinding    | Description                                            |
| ------------- | ------------------------------------------------------ |
| `<leader>a`   | Add the current file to the Harpoon list.              |
| `<C-e>`       | Toggle the Harpoon quick menu to see all marked files. |
| `<C-h>`       | Navigate to the 1st marked file.                       |
| `<C-j>`       | Navigate to the 2nd marked file.                       |
| `<C-k>`       | Navigate to the 3rd marked file.                       |
| `<C-l>`       | Navigate to the 4th marked file.                       |

### Intelephense License Setup

To use Intelephense with a license, you need to create a license file.

1.  Create a file `~/intelephense/licence.txt`.
2.  Add your license key to this file. Only add the license text inside, nothing else.

### WordPress Development

For WordPress development, you'll need to install `composer` and the `10up-default` coding standards for `phpcs`.

#### Composer Installation

First, install Composer globally. You can follow the official instructions on the [Composer website](https://getcomposer.org/doc/00-intro.md#globally).

On macOS, you can use Homebrew:


---

Made with ❤️ and Lua
