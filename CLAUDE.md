# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration targeting Neovim 0.11+. Philosophy: simple, minimal, close to vanilla Neovim. Uses native LSP completion (not nvim-cmp).

## Architecture

**Entry point:** `init.lua` → `lua/alex/init.lua` (orchestrator)

The orchestrator loads modules in order:
1. `bootstrap.lua` — Installs lazy.nvim plugin manager, sets leader to space, loads plugin specs from `lua/alex/lazy/`
2. `remap.lua` — All keybindings (LSP maps attached via `LspAttach` autocmd)
3. `autocmd.lua` — Auto-commands (yank highlight, git conflict notify, PHP auto-format, comment format options)
4. `set.lua` — Editor options (tabs, numbers, undo persistence, cursor, etc.)
5. `lsp.lua` — Enables LSP servers and configures native completion with autotrigger

**Plugin specs:** Each file in `lua/alex/lazy/*.lua` returns a lazy.nvim plugin spec table. The directory is auto-loaded by lazy.nvim.

**LSP server configs:** `lsp/*.lua` — Neovim 0.11 native LSP config format (one file per server). Servers are enabled in `lua/alex/lsp.lua`.

## Key Patterns

- Plugin manager: **lazy.nvim** (auto-bootstrapped from git)
- Completion: **Native Neovim 0.11 LSP completion** (no nvim-cmp)
- Snippets: **LuaSnip** with friendly-snippets
- Formatting: **conform.nvim** (triggered via `<leader>f`)
- Fuzzy finding: **Telescope** with live-grep-args extension
- File navigation: **Harpoon** (branch harpoon2)
- Git: **gitsigns.nvim** + **neogit** + **git-conflict.nvim**
- Theme: **tokyonight** (night variant, transparent)

## Enabled LSP Servers

gopls, lua_ls, intelephense (PHP), cssls, tailwindcss, css_variables, cssmodules_ls — configured in `lsp/*.lua`, enabled in `lua/alex/lsp.lua`.

## Requirements

Neovim 0.11+, ripgrep, fd, git.
