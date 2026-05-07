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
  lazy.lua                 -- lazy.nvim bootstrap + plugin spec import
lua/plugins/               -- one file per concern, each returns a lazy spec table
```

Each file under `lua/plugins/` is auto-imported by lazy via `{ import = "plugins" }`.

## Plugin categories

| File | Purpose |
|------|---------|
| `lsp.lua` | mason + mason-lspconfig + nvim-lspconfig (lua, ts/js/vue, css, elixir, python) |
| `completions.lua` | nvim-cmp with LuaSnip and LSP source |
| `none-ls.lua` | Formatting via null-ls: stylua, prettier, ktlint, csharpier — **format on save** |
| `treesitter.lua` | Syntax/indent for ~25 languages |
| `telescope.lua` | Fuzzy finder; `<C-p>` find files, `<leader>fg` grep |
| `neo-tree.lua` | File explorer; `<leader>e` open, `<leader>et` toggle |
| `editor.lua` | flash.nvim (motion), trouble.nvim (diagnostics), grug-far (search/replace), indent-blankline, virt-column at 80 |
| `git.lua` | gitsigns |
| `ui.lua` | snacks.nvim (dashboard, bufferline backend), bufferline, noice, lualine, which-key, mini.icons |
| `coding.lua` | mini.pairs (autopairs), ts-comments, lazydev (Lua LSP for nvim API) |
| `colorscheme.lua` | gruvbox (dark), with custom Treesitter highlight overrides for HTML tags |
| `ai.lua` | avante.nvim using GitHub Copilot (gpt-4o-2024-08-06); `copilot.vim` is disabled |
| `utils.lua` | vim-be-good (practice), vim-wakatime (time tracking) |

## Key keymaps

| Key | Action |
|-----|--------|
| `<leader>w` | Save |
| `<leader>q` / `<leader>Q` | Quit buffer / quit all |
| `<C-h/j/k/l>` | Navigate splits |
| `<leader>b]` / `<leader>b[` | Next / prev buffer |
| `<leader>bw` | Delete buffer (Snacks) |
| `<leader>gg` | Lazygit |
| `<leader>gb` | Git blame line |
| `<leader>gf` | Format buffer |
| `<leader>sr` | Search & replace (grug-far) |
| `<leader>xx` / `<leader>xX` | Diagnostics / buffer diagnostics (Trouble) |
| `<leader>ca` | LSP code action |
| `K` / `gd` | Hover / go to definition |
| `s` / `S` | Flash jump / treesitter jump |
| `<leader>?` | Which-key buffer keymaps |

## LSP servers

Configured via Mason: `lua_ls`, `ts_ls` (TypeScript + Vue plugin), `cssls`, `volar` (Vue), `elixirls`, `pylsp`.

`ts_ls` is wired with `@vue/typescript-plugin` so it handles `.vue` files alongside Volar.

## Formatting

none-ls runs formatters on `BufWritePre`. Active formatters: **stylua** (Lua), **prettier** (JS/TS/CSS/Vue), **ktlint** (Kotlin), **csharpier** (C#). biome and eslint are commented out.
