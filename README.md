# MateVim

![Logo](.github/assets/logo.png)

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg)](https://github.com/RichardLitt/standard-readme)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

> Configuração pessoal de Neovim baseada em [lazy.nvim](https://github.com/folke/lazy.nvim).

Desenhada para desenvolvimento full-stack com PHP, JavaScript/TypeScript/Vue, Go e SQL.

## Índice

- [Background](#background)
- [Instalação](#instalação)
- [Uso](#uso)
- [Contribuindo](#contribuindo)
- [Licença](#licença)

## Background

MateVim é uma config modular onde cada arquivo em `lua/plugins/` retorna um spec
do lazy.nvim, e `lua/plugins/lang/` estende tabelas `opts` compartilhadas por
linguagem (LSP, formatters, linters, DAP). Destaques:

- **LSP** via `mason` + `nvim-lspconfig` (PHP, TS/JS/Vue, CSS, Lua, Go, SQL).
- **Completion** com [blink.cmp](https://github.com/Saghen/blink.cmp) + LuaSnip.
- **Formatação on-save** com `conform.nvim` e **linting** com `nvim-lint`.
- **Debug** com `nvim-dap` e **testes** com `neotest`.
- **Database UI** (`vim-dadbod-ui`) e **HTTP client** (`kulala.nvim`).
- **UI** com `snacks.nvim`, `noice`, `bufferline`, `lualine` e `which-key`.
- Colorscheme: `gruvbox`

## Instalação

Requer **Neovim 0.10+**, além de `git`, `make`, `gcc/clang`, **Node.js**,
**ripgrep** e uma **Nerd Font** no terminal. Para debug de PHP, **PHP CLI +
Xdebug**.

```sh
# Backup de qualquer config existente
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

# Clone e abra — o lazy.nvim faz bootstrap automaticamente
git clone <url-do-repo> ~/.config/nvim
nvim
```

Na primeira execução o lazy.nvim instala os plugins e o mason baixa LSPs,
formatters, linters e adapters. Ao final, rode `:checkhealth` para validar.

## Uso

Leader é `<Space>`. Atalhos principais:

- `<leader><space>` / `<leader>ff` — find files &nbsp; `<leader>/` — grep
- `<leader>e` — explorer &nbsp; `<leader>gg` — lazygit
- `<leader>cf` — format &nbsp; `<leader>ca` — code action &nbsp; `<leader>cr` — rename
- `<leader>db` / `<leader>dc` — breakpoint / debug &nbsp; `<leader>D` — DBUI
- `<leader>tt` — rodar testes &nbsp; `<leader>?` — keymaps locais

Referência completa em [`docs/keybinds.md`](docs/keybinds.md).

Comandos úteis:

| Comando                               | Para quê                                        |
| ------------------------------------- | ----------------------------------------------- |
| `:Lazy sync`                          | Instala/atualiza/remove plugins.                |
| `:Mason`                              | UI de LSPs/formatters/linters/DAP.              |
| `:checkhealth`                        | Validação de saúde do Neovim + plugins.         |
| `:FormatDisable[!]` / `:FormatEnable` | Liga/desliga format-on-save (global ou buffer). |

Para adicionar uma linguagem, crie `lua/plugins/lang/<lang>.lua` retornando um
spec que estenda `mason.ensure_installed`, `nvim-lspconfig.servers`,
`conform.formatters_by_ft` e `nvim-lint.linters_by_ft` via `opts_extend`.

## Contribuindo

Config pessoal, mas PRs e issues são bem-vindos. Ao editar a documentação,
mantenha o estilo [standard-readme](https://github.com/RichardLitt/standard-readme).

## Licença

[MIT](LICENSE) © Gustavo Schneider
