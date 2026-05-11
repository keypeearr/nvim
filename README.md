# nvim

Personal Neovim configuration. Lazy.nvim-managed, native LSP via Mason, blink.cmp completion, fzf-lua for finding, conform.nvim for formatting.

## Requirements

- Neovim 0.11+ (uses `vim.lsp.config` / `vim.lsp.enable`)
- A Nerd Font (config assumes `vim.g.have_nerd_font = true`)
- `ripgrep` (used by `:grep` and fzf-lua)
- `git`, `lazygit` (for the snacks lazygit integration)
- Per-language toolchains for the LSPs and formatters you actually use (Go, Node, Lua, etc.)

## Layout

```
init.lua                 -- entry point
lua/
  config/
    options.lua          -- vim.opt settings, leader, filetypes
    keymaps.lua          -- non-plugin keymaps
    diagnostics.lua      -- vim.diagnostic.config
    lazy.lua             -- bootstraps lazy.nvim, imports plugins/
  plugins/               -- one file per plugin (auto-imported)
  lsp/                   -- per-server settings (lsp.<name>)
```

`plugins/lsp.lua` reads `lua/lsp/<server>.lua` for each enabled server, so adding a new LSP is: drop a file in `lua/lsp/`, add the name to the `server_names` list in `plugins/lsp.lua`.

## Plugins

### Core

- [lazy.nvim](https://github.com/folke/lazy.nvim) — plugin manager
- [snacks.nvim](https://github.com/folke/snacks.nvim) — dashboard, lazygit, notifier
- [which-key.nvim](https://github.com/folke/which-key.nvim) — keymap hints

### Editing

- [mini.nvim](https://github.com/echasnovski/mini.nvim) — `mini.ai`, `mini.surround`, `mini.comment`
- [flash.nvim](https://github.com/folke/flash.nvim) — motion (`s` to jump)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) + [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [better-escape.nvim](https://github.com/max397574/better-escape.nvim) — `jk`/`jj` to escape
- [guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim)
- [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim) — breaks bad habits

### Navigation

- [fzf-lua](https://github.com/ibhagwan/fzf-lua) — files, grep, buffers, LSP pickers
- [oil.nvim](https://github.com/stevearc/oil.nvim) + [oil-lsp-diagnostics.nvim](https://github.com/JezerM/oil-lsp-diagnostics.nvim) — file manager
- [outline.nvim](https://github.com/hedyhli/outline.nvim) — symbol outline

### LSP / Completion / Formatting

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [mason.nvim](https://github.com/mason-org/mason.nvim) + [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- [blink.cmp](https://github.com/saghen/blink.cmp) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [conform.nvim](https://github.com/stevearc/conform.nvim) — format on save

### Treesitter / UI

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors)
- [markview.nvim](https://github.com/OXY2DEV/markview.nvim) — markdown rendering
- [themify.nvim](https://github.com/lmantw/themify.nvim) — colorscheme picker with tokyonight, kanagawa-paper, catppuccin, gruvbox, rose-pine, vague, everforest, minimal, hubbamax
- [transparent.nvim](https://github.com/xiyaowong/transparent.nvim)

### Database

- [vim-dadbod](https://github.com/tpope/vim-dadbod) + [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) + [vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion)

## LSP servers (auto-installed via Mason)

`biome`, `cssls`, `gopls`, `html`, `lua_ls`, `sqlls`, `tailwindcss`, `templ`, `ts_ls`

Per-server overrides live in `lua/lsp/<name>.lua`.

## Formatters (auto-installed via Mason)

- Lua: `stylua`
- Go: `goimports-reviser` → `gofumpt` → `golines` (`--max-len=120`, `gofumpt -extra`)
- JS/TS/JSON: `biome` → `prettierd` → `prettier`
- HTML/CSS/SCSS/Markdown/YAML: `prettierd` → `prettier`
- Templ: `templ`
- SQL: `sqlfmt` → `sql-formatter`

Format-on-save is enabled (`format_on_save` in `plugins/conform.lua`, 1500ms timeout, LSP fallback).

## Keymaps

Leader is `<Space>`.

### General

| Keys           | Action                       |
| -------------- | ---------------------------- |
| `<Esc>`        | clear search highlight       |
| `<leader>q`    | close current buffer (force) |
| `<leader>Q`    | diagnostics → loclist        |
| `<leader>H`    | horizontal split             |
| `<leader>V`    | vertical split               |
| `<C-h/j/k/l>`  | move between splits          |
| `<leader>rh/l` | resize split left / right    |
| `<leader>rk/j` | resize split up / down       |

### Find (fzf-lua)

| Keys                | Action                |
| ------------------- | --------------------- |
| `<leader>ff`        | files                 |
| `<leader>fg`        | live grep             |
| `<leader>fw`        | grep word under cursor|
| `<leader>fh`        | help tags             |
| `<leader>fk`        | keymaps               |
| `<leader>f.`        | recent files          |
| `<leader>fn`        | files in nvim config  |
| `<leader>fr`        | resume last picker    |
| `<leader>fdd`       | document diagnostics  |
| `<leader>fdw`       | workspace diagnostics |
| `<leader>fo`        | TODO comments         |
| `<leader>ft`        | switch theme          |
| `<leader><leader>`  | buffers               |
| `<leader>/`         | current buffer lines  |
| `<leader>f/`        | lines in open buffers |

### LSP (on attach)

| Keys   | Action               |
| ------ | -------------------- |
| `rn`   | rename               |
| `ca`   | code action          |
| `cA`   | fzf-lua code actions |
| `gd`   | definition           |
| `gD`   | declaration          |
| `gr`   | references           |
| `gI`   | implementation       |
| `gt`   | type definition      |
| `gs`   | document symbols     |
| `gW`   | workspace symbols    |
| `<leader>th` | toggle inlay hints |

### Other

| Keys          | Action                    |
| ------------- | ------------------------- |
| `s`           | flash jump                |
| `<leader>e`   | open Oil (file manager)   |
| `<leader>ss`  | symbol outline            |
| `<leader>lg`  | LazyGit                   |
| `<leader>db`  | DBUI (dadbod)             |
| `<leader>mt`  | toggle markview           |
| `<leader>ms`  | markview split toggle     |
| `<leader>nsh` | notifier history          |
| `<leader>nh`  | hide notifier             |

## Notes

- Diagnostics config is centralized in `lua/config/diagnostics.lua` (loaded from `init.lua`).
- `vim.loader.enable()` is on for faster startup.
- Clipboard is unnamedplus locally, disabled over SSH (`SSH_TTY` check).
- `timeoutlen = 300` (1000 inside vscode-neovim).
- Folding is set to `expr` but no `foldexpr` is configured — folds are effectively inactive until a `foldexpr` is set (e.g. `v:lua.vim.treesitter.foldexpr()`).

## References

- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) — the LSP attach pattern, diagnostic config style, and overall structure of this config are based on kickstart.nvim.
