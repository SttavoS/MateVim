# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

MateVim is a personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim). There is no build, test, or lint step — changes take effect by reloading Neovim (`:Lazy reload <plugin>` or restarting nvim).

To update all plugins: `:Lazy update`. The lockfile is `lazy-lock.json`.

## Structure

```
init.lua                   -- entry point: loads config/*, then lazy
lua/config/
  options.lua              -- vim.opt settings (leader = <Space>, 2-space indent, no swap)
  keymaps.lua              -- global keymaps
  autocmds.lua             -- highlight yank, close-with-q, auto-mkdir, restore cursor
  lazy.lua                 -- lazy.nvim bootstrap + plugin spec import
lua/plugins/               -- one file per concern, each returns a lazy spec table
lua/plugins/lang/          -- per-language extras (extend opts.servers / formatters / linters)
```

Lazy auto-imports `{ import = "plugins" }` and `{ import = "plugins.lang" }`. Lang files extend shared `opts` tables (mason `ensure_installed`, lspconfig `servers`, conform `formatters_by_ft`, nvim-lint `linters_by_ft`) via `opts_extend`.

## Plugin categories

| File | Purpose |
|------|---------|
| `lsp.lua` | mason + mason-lspconfig + nvim-lspconfig. Servers declared in `opts.servers` table (lua, ts/js/vue, css, php). LSP keymaps in `LspAttach` autocmd. |
| `treesitter.lua` | Syntax/indent for ~22 languages including go, gomod, gosum, gowork |
| `completions.lua` | nvim-cmp with LuaSnip and LSP source |
| `formatting.lua` | conform.nvim — **format on save** with `:FormatDisable[!]` / `:FormatEnable` toggle |
| `linting.lua` | nvim-lint — eslint_d (js/ts/vue), phpstan (php), sqlfluff (sql) |
| `snacks.lua` | snacks.nvim (dashboard, picker, explorer, lazygit, notifier, indent guides) |
| `editor.lua` | flash.nvim (motion), trouble.nvim (diagnostics), gitsigns, grug-far, virt-column at 80 |
| `ui.lua` | bufferline, noice, lualine, which-key, mini.icons |
| `coding.lua` | mini.pairs (autopairs), nvim-ts-autotag, ts-comments, lazydev (Lua LSP for nvim API) |
| `colorscheme.lua` | gruvbox (dark), with custom Treesitter highlight overrides for HTML tags |
| `utils.lua` | vim-be-good (practice), vim-wakatime (time tracking) |
| `lang/go.lua` | gopls + gofumpt/goimports + golangci-lint |
| `lang/php.lua` | Placeholder; phpactor/php-cs-fixer/phpstan already wired in core files |
| `lang/sql.lua` | sqls + sql-formatter |

## Key keymaps

| Key | Action |
|-----|--------|
| `<C-s>` | Save |
| `<leader>q` / `<leader>Q` | Quit buffer / quit all |
| `<C-h/j/k/l>` | Navigate splits |
| `[b` / `]b` | Prev / next buffer (bufferline) |
| `<leader>bd` | Delete buffer (Snacks) |
| `<leader>gg` | Lazygit |
| `<leader>gb` | Git blame line |
| `<leader>cf` | Format buffer (manual; format-on-save also active) |
| `<leader>sr` | Search & replace (grug-far) |
| `<leader>xx` / `<leader>xX` | Diagnostics / buffer diagnostics (Trouble) |
| `<leader>ca` | LSP code action |
| `K` / `gd` | Hover / go to definition (buffer-local, on LspAttach) |
| `s` / `S` | Flash jump / treesitter jump |
| `<leader><space>` / `<leader>ff` | Find files (Snacks) |
| `<leader>e` | File explorer (Snacks) |
| `<leader>?` | Which-key buffer keymaps |

## LSP servers

Declared in `lsp.lua` via the `opts.servers` table. Per-language files under `lua/plugins/lang/` extend this table.

Core: `lua_ls`, `ts_ls` (TypeScript + Vue plugin via `@vue/typescript-plugin`), `cssls`, `vue_ls` (Volar), `phpactor`.
Lang extras: `gopls` (go.lua), `sqls` (sql.lua).

## Formatting

`conform.nvim` formats on `BufWritePre` (via `format_on_save` option). Manual: `<leader>cf`. Toggle off with `:FormatDisable` (global) or `:FormatDisable!` (buffer); re-enable with `:FormatEnable`.

Active formatters: **stylua** (Lua), **prettier** (JS/TS/JSX/TSX/Vue/CSS/HTML/JSON/YAML/MD), **php_cs_fixer** (PHP), **goimports + gofumpt** (Go), **sql_formatter** (SQL).

## Linting

`nvim-lint` runs on `BufWritePost,BufReadPost,InsertLeave`. Active: **eslint_d** (JS/TS/Vue), **phpstan** (PHP), **sqlfluff** (SQL), **golangcilint** (Go). LSP diagnostics run independently of nvim-lint.
