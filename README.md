
# Neovim Configuration

My personal Neovim configuration for Neovim 0.9+.

[![CodeRabbit Pull Request Reviews](https://img.shields.io/coderabbit/prs/github/xavortm/neovim?utm_source=oss&utm_medium=github&utm_campaign=xavortm%2Fneovim&labelColor=171717&color=FF570A&link=https%3A%2F%2Fcoderabbit.ai&label=CodeRabbit+Reviews)](https://coderabbit.ai)
![Work in progress](https://img.shields.io/badge/work_in_progress-blue)

---

## 📚 Table of Contents


- [Neovim Configuration](#neovim-configuration)
  - [📚 Table of Contents](#-table-of-contents)
  - [✨ Features](#-features)
  - [🔌 Plugins](#-plugins)
  - [📦 Requirements](#-requirements)
  - [🚀 Installation](#-installation)
  - [⌨️ Keybindings](#️-keybindings)
    - [📌 Harpoon Usage](#-harpoon-usage)
    - [🧩 Intelephense License Setup](#-intelephense-license-setup)
    - [📝 WordPress Development](#-wordpress-development)
      - [Composer Installation](#composer-installation)
      - [PHPCS and 10up Coding Standards](#phpcs-and-10up-coding-standards)
  - [🛠️ Troubleshooting](#️-troubleshooting)
  - [🤝 Contributing](#-contributing)
  - [📄 License](#-license)



## ✨ Features

- **Simple, minimal experience**: Close to vanilla Neovim, easy to understand and extend.
- **Fast & Lightweight**: Optimized for performance and quick startup.
- **Smart Completion**: Powered by `luasnip` and `cmp` for efficient coding.
- **LSP Support**: Full-featured language server support with `mason` and custom LSP setup.
- **Git Integration**: Seamless git workflow with `gitsigns` and `neogit`.
- **Fuzzy Finding**: Quick file and text searching with `telescope`.
- **Beautiful Theme**: Uses `rose-pine` for a modern look.
- **And much more...**

## 🔌 Plugins

This configuration is built on top of a curated list of plugins, including:

- **[Blink.nvim](https://github.com/xavortm/blink.nvim)**: Easy navigation between files.
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)**: Smart commenting.
- **[Gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Git decorations.
- **[Harpoon](https://github.com/ThePrimeagen/harpoon)**: File marking and navigation.
- **[LSP Config](https://github.com/neovim/nvim-lspconfig)**, **[Mason](https://github.com/williamboman/mason.nvim)**, **[Luasnip](https://github.com/L3MON4D3/LuaSnip)**, etc.: The core of the modern Neovim experience.
- **[Rose-pine](https://github.com/rose-pine/neovim)**: A beautiful, modern theme.
- **[Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: Powerful fuzzy finding.
- **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Advanced syntax highlighting and code parsing.
- **[Which-key.nvim](https://github.com/folke/which-key.nvim)**: Keybinding hints.

...and more. See the [`lua/alex/lazy`](lua/alex/lazy) directory for the full list and configuration.

## � Requirements

- **Neovim 0.9+** ([Install](https://github.com/neovim/neovim/releases)). I use 0.11.0
- **git**
- **curl** or **wget**
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** (for better search)
- **[fd](https://github.com/sharkdp/fd)** (for file finding)

## 🚀 Installation

1. **Backup your current config** (if needed):
    ```bash
    mv ~/.config/nvim ~/.config/nvim.backup
    ```
2. **Clone this repository**:
    ```bash
    git clone https://github.com/xavortm/neovim.git ~/.config/nvim
    ```
3. **Start Neovim**:
    ```bash
    nvim
    ```
    The plugins will be installed automatically by `lazy.nvim` on first launch.

> **Tip:** If you use a different OS or custom runtime path, adjust the clone path accordingly.

## ⌨️ Keybindings

The main keybindings are defined in [`lua/alex/remap.lua`](lua/alex/remap.lua). `which-key.nvim` provides a popup with available keybindings. Here are some of the most important ones:

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

[Harpoon](https://github.com/ThePrimeagen/harpoon) allows you to quickly mark files and jump between them.

| Keybinding    | Description                                            |
| ------------- | ------------------------------------------------------ |
| `<leader>a`   | Add the current file to the Harpoon list.              |
| `<C-e>`       | Toggle the Harpoon quick menu to see all marked files. |
| `<C-h>`       | Navigate to the 1st marked file.                       |
| `<C-j>`       | Navigate to the 2nd marked file.                       |
| `<C-k>`       | Navigate to the 3rd marked file.                       |
| `<C-l>`       | Navigate to the 4th marked file.                       |

### 🧩 Intelephense License Setup

To use [Intelephense](https://intelephense.com/) with a license:

1. Create a file at `~/intelephense/licence.txt`.
2. Add your license key to this file (only the license text, nothing else).

### 📝 WordPress Development

For WordPress development, install `composer` and the `10up-default` coding standards for `phpcs`. I have documented some of the steps in [this blog post](https://xavortm.com/php_cs-in-neovim/)

#### Composer Installation

Install Composer globally. See the [Composer website](https://getcomposer.org/doc/00-intro.md#globally) for official instructions.

On macOS, you can use Homebrew:

```bash
brew install composer
```

#### PHPCS and 10up Coding Standards

After installing Composer:

```bash
composer global require "squizlabs/php_codesniffer=*"
composer global require "10up/wp-phpcs:dev-master"
```

Then add the 10up standard to PHPCS:

```bash
phpcs --config-set installed_paths ~/.composer/vendor/10up/wp-phpcs
```


## 🛠️ Troubleshooting

- **Plugin install fails**: Make sure you have a working internet connection and the correct Neovim version.
- **LSP not working**: Check `:LspInfo` and ensure the language server is installed (see `lua/alex/lsp.lua`).
- **Keybindings not working**: Run `:checkhealth` and check for errors in your config files.
- **General issues**: Try running Neovim with `nvim --clean` to rule out plugin conflicts.

If you encounter issues, feel free to open an issue or discussion on the repository.

## 🤝 Contributing

Contributions, suggestions, and PRs are welcome, but I suggest you just set it up as you want in your project. Please open an issue or pull request if you have ideas or improvements, I don\'t mind making my setup better :) Just keep in mind it\'s my personal setup.

## 📄 License

This configuration is open source under the MIT License. See [LICENSE](LICENSE) for details.

---

Made with ❤️ and Lua
