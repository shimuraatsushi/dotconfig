# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles/config repository managed at `~/.config`. It contains configuration for Neovim, tmux, zsh, git, and related tools.

## Structure

- `nvim/` — Neovim config using [lazy.nvim](https://github.com/folke/lazy.nvim)
  - `init.lua` — Entry point; loads `config/options`, `config/keymaps`, `config/lazy`; WSL clipboard setup via `win32yank.exe`
  - `lua/config/` — Core settings: options, keymaps, plugin manager bootstrap
  - `lua/plugins/` — Plugin specs (one file per plugin group)
- `tmux/` — Tmux config split into `tmux.conf`, `statusline.conf`, `utility.conf`
- `zsh/` — Zsh configuration
- `git/` — Git-related configs
- `.gitconfig` — Git aliases and user settings (at repo root, symlinked to `~/.gitconfig`)

## Neovim Plugin Architecture

Plugins are managed with lazy.nvim. Each file in `lua/plugins/` returns a table of plugin specs.

Current plugins:
- `editor.lua` — `copilot.vim` (accept with `<C-l>`), `lualine`, `nvim-treesitter`
- `telescope.lua` — `telescope.nvim` with `fzf-native` extension
- `bufferline.lua` — `bufferline.nvim` (cycle with `<C-j>`/`<C-k>`)
- `colorscheme.lua` — `gruvbox.nvim` (active); monokai-pro and onedarkpro commented out

Key leader mappings (`<Space>` is leader):
- `<leader>ff` — Telescope find files
- `<leader>fg` — Telescope live grep
- `<leader>fb` — Telescope buffers

## tmux Key Bindings

- Prefix + `r` — Reload tmux config
- `|` or `%` — Vertical split (current path)
- `-` or `"` — Horizontal split (current path)
- `hjkl` — Vim-style pane navigation
- `<C-h>`/`<C-l>` — Window cycling
- Copy mode uses vi keys; `y` copies via `pbcopy`

## Git Aliases (from .gitconfig)

Frequently used aliases: `st` (status), `up` (pull --rebase), `rbm` (rebase main), `cb` (checkout -b), `dm` (diff main), `log-graph`, `lga` (log graph all).
