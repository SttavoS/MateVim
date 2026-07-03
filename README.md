# MateVim

![Logo](.github/assets/logo.png)

Configuração pessoal de Neovim baseada em [lazy.nvim](https://github.com/folke/lazy.nvim),
desenhada para desenvolvimento full-stack com PHP, JavaScript/TypeScript/Vue,
Go e SQL — com paridade de funcionalidades com PhpStorm e LazyVim.

## Destaques

- **LSP completo** via `mason` + `nvim-lspconfig` (PHP, TS/JS/Vue, CSS, Lua, Go, SQL).
- **Completion** com [blink.cmp](https://github.com/Saghen/blink.cmp) + LuaSnip + friendly-snippets.
- **Formatação on-save** com `conform.nvim` (stylua, prettier, php-cs-fixer, gofumpt, sql-formatter).
- **Linting** com `nvim-lint` (eslint_d, phpstan, golangci-lint, sqlfluff).
- **Debugger** com `nvim-dap` + `dap-ui` + Xdebug (PHP) na porta 9003.
- **Database UI** com `vim-dadbod-ui` (equivalente à Database tool window do PhpStorm).
- **HTTP client** com `kulala.nvim` (equivalente ao HTTP Client do PhpStorm).
- **Runner de testes** com `neotest` (PHPUnit + Go).
- **Refactoring** com `inc-rename`, `mini.surround`, `mini.ai` e `nvim-treesitter-textobjects`.
- **Navegação** com `aerial` (outline), `harpoon` (marks), `flash` (jump), `todo-comments`, `undotree`.
- **UI**: `snacks.nvim` (dashboard, picker, explorer, lazygit, notifier, indent guides, zen, scroll), `noice`, `bufferline`, `lualine`, `gruvbox`, `which-key`.

## Estrutura

```
init.lua                   -- entrypoint: carrega config/* e o lazy
lua/config/
  options.lua              -- vim.opt (leader = <Space>, 2-space indent)
  keymaps.lua              -- keymaps globais e toggles <leader>u*
  autocmds.lua             -- highlight yank, close-with-q, auto-mkdir, restore cursor
  lazy.lua                 -- bootstrap do lazy.nvim
lua/plugins/               -- um arquivo por categoria, cada um retorna spec do lazy
lua/plugins/lang/          -- extras por linguagem (estendem opts compartilhados)
docs/keybinds.md           -- referência completa dos atalhos
```

Lazy importa automaticamente `{ import = "plugins" }` e `{ import = "plugins.lang" }`.
Os arquivos de `lang/` estendem tabelas `opts` compartilhadas (mason
`ensure_installed`, lspconfig `servers`, `formatters_by_ft`, `linters_by_ft`)
via `opts_extend`.

## Plugins por arquivo

| Arquivo           | Conteúdo                                                                                                                            |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `lsp.lua`         | mason, mason-lspconfig, nvim-lspconfig. `LspAttach` registra os keymaps de LSP, `vim.diagnostic.config` define UI dos diagnósticos. |
| `completions.lua` | blink.cmp + LuaSnip + friendly-snippets, source `dadbod` em SQL.                                                                    |
| `formatting.lua`  | conform.nvim com format-on-save + `:FormatDisable[!]` / `:FormatEnable`.                                                            |
| `linting.lua`     | nvim-lint (eslint_d, phpstan, sqlfluff, golangcilint).                                                                              |
| `treesitter.lua`  | parsers de ~30 linguagens.                                                                                                          |
| `coding.lua`      | mini.pairs, mini.surround, mini.ai, treesitter-textobjects, inc-rename, nvim-ts-autotag, ts-comments, lazydev.                      |
| `editor.lua`      | gitsigns, virt-column (80), grug-far, flash, trouble.                                                                               |
| `ui.lua`          | bufferline, noice, lualine, which-key, mini.icons.                                                                                  |
| `snacks.lua`      | snacks.nvim (dashboard, picker, explorer, lazygit, notifier, indent, zen, scroll, scope, dim, image, words, rename).                |
| `colorscheme.lua` | gruvbox dark com overrides de Treesitter.                                                                                           |
| `dap.lua`         | nvim-dap + dap-ui + virtual-text + vscode-php-debug (Xdebug 9003).                                                                  |
| `database.lua`    | vim-dadbod + dadbod-ui + dadbod-completion.                                                                                         |
| `rest.lua`        | kulala.nvim (HTTP client).                                                                                                          |
| `testing.lua`     | neotest + neotest-phpunit + neotest-go.                                                                                             |
| `navigation.lua`  | aerial, harpoon, todo-comments, undotree.                                                                                           |
| `qol.lua`         | render-markdown, nvim-colorizer, yanky, diffview.                                                                                   |
| `utils.lua`       | vim-be-good, vim-wakatime.                                                                                                          |
| `lang/go.lua`     | gopls + gofumpt/goimports + golangci-lint.                                                                                          |
| `lang/php.lua`    | php-debug-adapter via mason.                                                                                                        |
| `lang/sql.lua`    | sqls + sql_formatter.                                                                                                               |

## Requisitos

- **Neovim 0.10+** (algumas APIs como `vim.diagnostic.jump` e `vim.lsp.inlay_hint` requerem 0.10).
- **git**, **make**, **gcc/clang** (para alguns parsers de treesitter).
- **Node.js** (para `vscode-php-debug`, `eslint_d`, language servers JS/TS, vue, css).
- **Composer + PHP CLI** com **Xdebug** para debugging PHP.
- **ripgrep** (`rg`) para os pickers de grep do snacks.
- **fd** (opcional) para picker de arquivos mais rápido.
- **lazygit** para `<leader>gg`.
- Uma **Nerd Font** instalada e selecionada no terminal (gruvbox + mini.icons usam glifos).

## Instalação

```sh
# Backup de qualquer config existente
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

# Clone deste repositório
git clone <url-do-repo> ~/.config/nvim

# Abre o Neovim — o lazy.nvim faz bootstrap automaticamente
nvim
```

Na primeira execução o lazy.nvim instala os plugins e o mason começa a baixar
LSPs, formatters, linters e adapters. Aguarde e rode `:checkhealth` no final
para validar.

## Comandos úteis

| Comando                               | Para quê                                                      |
| ------------------------------------- | ------------------------------------------------------------- |
| `:Lazy sync`                          | Atualiza, instala e remove plugins conforme `lazy-lock.json`. |
| `:Mason`                              | UI para LSPs/formatters/linters/DAP adapters.                 |
| `:checkhealth`                        | Validação de saúde do Neovim + plugins.                       |
| `:FormatDisable[!]` / `:FormatEnable` | Liga/desliga format-on-save (global ou buffer).               |
| `:ConformInfo`                        | Diagnostica o estado do conform.                              |
| `:LspInfo`                            | Estado dos servidores LSP no buffer.                          |
| `:Trouble diagnostics toggle`         | Janela de diagnósticos.                                       |
| `:DBUIToggle`                         | Abrir/fechar a UI do dadbod.                                  |
| `:IncRename <novo>`                   | Rename com preview.                                           |

## Keybinds

Referência completa: [`docs/keybinds.md`](docs/keybinds.md).

Resumo dos principais:

- **Leader** = `<Space>`.
- `<leader><space>` ou `<leader>ff` — find files.
- `<leader>/` — grep no projeto.
- `<leader>e` — file explorer.
- `<leader>gg` — lazygit.
- `<leader>cf` — format buffer.
- `<leader>ca` — code action.
- `<leader>cr` — rename (com preview).
- `<leader>db` — toggle breakpoint, `<leader>dc` — start/continue debug.
- `<leader>D` — toggle DBUI.
- `<leader>tt` — rodar testes do arquivo.
- `<leader>?` — keymaps locais (which-key).

## Customização

- **Adicionar uma linguagem**: crie `lua/plugins/lang/<lang>.lua` retornando
  um spec que estenda `mason.ensure_installed`, `nvim-lspconfig.servers`,
  `conform.formatters_by_ft` e `nvim-lint.linters_by_ft` via `opts_extend`.
- **Trocar de colorscheme**: edite `lua/plugins/colorscheme.lua`.
- **Adicionar plugin**: crie um arquivo em `lua/plugins/` retornando um spec
  do lazy. Lazy descobre automaticamente.
- **Sobrescrever keymap LSP**: edite o `LspAttach` em `lua/plugins/lsp.lua`.

## Atualização

```sh
# Atualizar plugins (gera lock novo)
nvim -c "Lazy sync"

# Atualizar tools do mason
nvim -c "MasonToolsUpdate"   # se mason-tool-installer estiver presente
# ou abra :Mason e use U
```

## Solução de problemas

- **Glifos quebrados / quadrados**: verifique se está usando uma Nerd Font no
  terminal (`Berkeley Mono Nerd Font`, `FiraCode Nerd Font`, etc.).
- **LSP não anexa**: rode `:Mason` e confirme o servidor instalado;
  `:LspInfo` mostra o estado.
- **Xdebug não conecta**: confirme `xdebug.client_port=9003`,
  `xdebug.mode=debug` no `php.ini`, breakpoint setado e
  `<leader>dc` → "Listen for Xdebug" antes de disparar o request.
- **Formatter falhando**: `:ConformInfo` mostra qual formatter o conform
  resolve para o filetype atual.
- **Lentidão na abertura de arquivos grandes**: `snacks.bigfile` desabilita
  treesitter/LSP em arquivos > 1.5MB automaticamente.

## Licença

Configuração pessoal sem licença explícita. Use à vontade, sem garantias.
