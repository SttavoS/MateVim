# Keybinds — MateVim

> Leader = `<Space>`. Documento gerado a partir de `lua/config/`, `lua/plugins/` e `lua/plugins/lang/`.
> Use `<leader>?` para ver os keymaps locais ao buffer atual via which-key.

## Sumário

- [Globais](#globais)
- [LSP](#lsp)
- [Completion (blink.cmp)](#completion-blinkcmp)
- [Picker, explorer e dashboard (Snacks)](#picker-explorer-e-dashboard-snacks)
- [Buffers (bufferline + snacks.bufdelete)](#buffers-bufferline--snacksbufdelete)
- [Git](#git)
- [Diagnósticos (Trouble + todo-comments)](#diagnósticos-trouble--todo-comments)
- [Busca e substituição](#busca-e-substituição)
- [Navegação (Flash)](#navegação-flash)
- [Formatação](#formatação)
- [Refactoring e text objects (mini + treesitter)](#refactoring-e-text-objects-mini--treesitter)
- [Debugger (nvim-dap)](#debugger-nvim-dap)
- [Database (vim-dadbod-ui)](#database-vim-dadbod-ui)
- [REST client (Kulala)](#rest-client-kulala)
- [Testes (Neotest)](#testes-neotest)
- [Outline e marks (Aerial + Harpoon + Undotree)](#outline-e-marks-aerial--harpoon--undotree)
- [Yank history (Yanky)](#yank-history-yanky)
- [Diffview](#diffview)
- [Which-key](#which-key)

---

## Globais

Definidos em `lua/config/keymaps.lua`.

| Atalho | Modo | Ação |
|---|---|---|
| `<C-a>` | n | Selecionar tudo |
| `<C-s>` | n | Salvar arquivo |
| `<leader>q` | n | Fechar buffer (`:quit`) |
| `<leader>Q` | n | Sair do Neovim (`:qa`) |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | n | Navegar entre splits |
| `<leader>uw` | n | Toggle wrap |
| `<leader>us` | n | Toggle spell |
| `<leader>ud` | n | Toggle diagnostics |
| `<leader>ul` | n | Toggle relativenumber |

Autocmds em `lua/config/autocmds.lua` adicionam `q` para fechar buffers de
help/quickfix/Trouble/notify/dbout/grug-far/neotest, e restauração do cursor
ao abrir um arquivo.

---

## LSP

Registrados no `LspAttach` em `lua/plugins/lsp.lua`. Disponíveis sempre que um
servidor LSP anexar ao buffer.

| Atalho | Modo | Ação |
|---|---|---|
| `K` | n | Hover |
| `gd` | n | Go to Definition |
| `gD` | n | Go to Declaration |
| `gr` | n | References |
| `gi` | n | Implementation |
| `gy` | n | Type Definition |
| `gK` | n | Signature Help |
| `<leader>cr` | n | Rename (via inc-rename, com preview) |
| `<leader>ca` | n, v | Code Action |
| `<leader>co` | n | Organize Imports |
| `<leader>cd` | n | Diagnóstico da linha (float) |
| `]d` / `[d` | n | Próximo / anterior diagnóstico |
| `<leader>uh` | n | Toggle inlay hints (se suportado) |

`vim.diagnostic.config` em `lsp.lua` define signs/virtual_text/float
arredondado com `severity_sort = true`.

---

## Completion (blink.cmp)

Preset `default`. Configurado em `lua/plugins/completions.lua`.

| Atalho | Modo | Ação |
|---|---|---|
| `<C-Space>` | i | Mostrar / mostrar docs / esconder docs |
| `<CR>` | i | Aceitar item ou fallback `<CR>` |
| `<C-y>` | i | Aceitar item selecionado |
| `<C-e>` | i | Esconder menu |
| `<C-n>` / `<C-p>` | i | Próximo / anterior |
| `<C-b>` / `<C-f>` | i | Rolar documentação |
| `<C-k>` | i | Signature help (toggle) |
| `<Tab>` / `<S-Tab>` | i | Avançar / voltar nos snippet placeholders |

Sources padrão: `lsp`, `path`, `snippets` (LuaSnip + friendly-snippets),
`buffer`. Em `sql`/`mysql`/`plsql` é adicionado `dadbod`.

---

## Picker, explorer e dashboard (Snacks)

`lua/plugins/snacks.lua`. Substitui Telescope.

| Atalho | Modo | Ação |
|---|---|---|
| `<leader><space>` | n | Find Files |
| `<leader>/` | n | Grep |
| `<leader>,` | n | Buffers |
| `<leader>:` | n | Command History |
| `<leader>e` | n | File Explorer |
| `<leader>n` | n | Notification History |
| `<leader>un` | n | Dismiss All Notifications |
| `<leader>uz` | n | Toggle Zen Mode |
| `<leader>cR` | n | Rename File (snacks.rename) |
| `<leader>ff` | n | Find Files |
| `<leader>fb` | n | Buffers |
| `<leader>fc` | n | Config files |
| `<leader>fg` | n | Git files |
| `<leader>fr` | n | Recent |
| `<leader>sb` | n | Buffer Lines |
| `<leader>sB` | n | Grep Open Buffers |
| `<leader>sg` | n | Grep |
| `<leader>sw` | n, x | Visual selection / word |

Dashboard (`alpha` MATEVIM) — teclas exibidas na tela: `f` find file,
`n` new file, `g` find text, `r` recent files, `c` config, `s` restore
session, `l` Lazy, `q` quit.

---

## Buffers (bufferline + snacks.bufdelete)

| Atalho | Modo | Ação |
|---|---|---|
| `[b` / `]b` | n | Buffer anterior / próximo |
| `[B` / `]B` | n | Mover buffer para esquerda / direita |
| `<leader>bd` | n | Deletar buffer |
| `<leader>bp` | n | Pin/unpin buffer |
| `<leader>bP` | n | Deletar buffers não pinados |
| `<leader>br` | n | Deletar buffers à direita |
| `<leader>bl` | n | Deletar buffers à esquerda |

---

## Git

| Atalho | Modo | Ação | Plugin |
|---|---|---|---|
| `<leader>gg` | n | Lazygit | snacks |
| `<leader>gl` | n | Lazygit log (cwd) | snacks |
| `<leader>gb` | n | Git blame line | snacks |
| `<leader>gc` | n | Git log (picker) | snacks |
| `<leader>gs` | n | Git status (picker) | snacks |
| `<leader>gd` | n | Diffview Open | diffview |
| `<leader>gD` | n | Diffview Close | diffview |
| `<leader>gh` | n | File History (arquivo atual) | diffview |
| `<leader>gH` | n | File History (branch) | diffview |

`gitsigns.nvim` está ativo (sinais na statuscolumn); usa defaults.

---

## Diagnósticos (Trouble + todo-comments)

| Atalho | Modo | Ação |
|---|---|---|
| `<leader>xx` | n | Diagnostics (Trouble) |
| `<leader>xX` | n | Buffer Diagnostics (Trouble) |
| `<leader>cs` | n | Symbols (Trouble) |
| `<leader>cl` | n | LSP defs / refs (Trouble) |
| `<leader>xL` | n | Location List (Trouble) |
| `<leader>xQ` | n | Quickfix List (Trouble) |
| `<leader>xt` | n | Todos (Trouble) |
| `<leader>st` | n | Picker de TODOs (snacks) |
| `]t` / `[t` | n | Próximo / anterior TODO |

---

## Busca e substituição

| Atalho | Modo | Ação | Plugin |
|---|---|---|---|
| `<leader>sr` | n, v | Search & Replace | grug-far |
| `<leader>/` | n | Grep no projeto | snacks.picker |
| `<leader>sg` | n | Grep no projeto | snacks.picker |
| `<leader>sw` | n, x | Grep palavra/seleção | snacks.picker |

---

## Navegação (Flash)

| Atalho | Modo | Ação |
|---|---|---|
| `s` | n, x, o | Flash jump |
| `S` | n, x, o | Flash Treesitter |
| `r` | o | Remote Flash |
| `R` | o, x | Treesitter Search |
| `<C-s>` | c | Toggle Flash em busca `/?` |

---

## Formatação

| Atalho | Modo | Ação |
|---|---|---|
| `<leader>cf` | n, v | Format buffer (conform) |
| `<leader>cF` | n, v | Format Injected Langs |

Format-on-save está ativo. Para desligar temporariamente:

- `:FormatDisable` — desabilita global
- `:FormatDisable!` — desabilita só o buffer
- `:FormatEnable` — re-habilita

Formatters por linguagem em `lua/plugins/formatting.lua`.

---

## Refactoring e text objects (mini + treesitter)

### mini.surround (`lua/plugins/coding.lua`)

| Atalho | Modo | Ação |
|---|---|---|
| `sa` | n, x | Add surround (ex.: `saiw"` envolve palavra em aspas) |
| `sd` | n | Delete surround (`sd"` remove aspas) |
| `sr` | n | Replace surround (`sr"'` troca `"` por `'`) |
| `sf` / `sF` | n | Find right / left surround |
| `sh` | n | Highlight surround |
| `sn` | n | Atualizar `n_lines` |

### mini.ai — text objects (combine com operadores `d`/`c`/`v`/`y`)

| Objeto | Externo | Interno |
|---|---|---|
| Função | `af` | `if` |
| Classe | `ac` | `ic` |
| Block/condicional/loop | `ao` | `io` |
| Tag HTML/JSX | `at` | `it` |

Os text objects padrão do Vim (`aw`/`iw`, `ap`/`ip`, `a"`/`i"`, etc.) também
funcionam normalmente.

### nvim-treesitter-textobjects — movimento

| Atalho | Ação |
|---|---|
| `]f` / `[f` | Próxima / anterior função (início) |
| `]F` / `[F` | Próxima / anterior função (fim) |
| `]c` / `[c` | Próxima / anterior classe (início) |
| `]C` / `[C` | Próxima / anterior classe (fim) |
| `]a` / `[a` | Próximo / anterior parâmetro |

---

## Debugger (nvim-dap)

`lua/plugins/dap.lua`. Adapter PHP via `vscode-php-debug` (mason). Xdebug
porta 9003.

| Atalho | Modo | Ação |
|---|---|---|
| `<leader>db` | n | Toggle Breakpoint |
| `<leader>dB` | n | Breakpoint condicional |
| `<leader>dc` | n | Continue / iniciar sessão |
| `<leader>di` | n | Step Into |
| `<leader>do` | n | Step Over |
| `<leader>dO` | n | Step Out |
| `<leader>dl` | n | Run Last |
| `<leader>dt` | n | Terminate |
| `<leader>dr` | n | Toggle REPL |
| `<leader>du` | n | Toggle DAP UI |
| `<leader>de` | n, v | Eval expression |

Configurações PHP disponíveis no `:DapContinue`:
- **Listen for Xdebug** (port 9003) — para anexar a requests HTTP.
- **Launch current script** — roda o arquivo atual sob xdebug.

Para xdebug, no `php.ini`:

```ini
zend_extension=xdebug
xdebug.mode=debug
xdebug.start_with_request=trigger
xdebug.client_port=9003
```

---

## Database (vim-dadbod-ui)

`lua/plugins/database.lua`. Completion `dadbod` é injetado no blink.cmp em
filetypes `sql`, `mysql`, `plsql`.

| Atalho | Modo | Ação |
|---|---|---|
| `<leader>D` | n | Toggle DBUI |
| `<leader>Df` | n | DBUI Find Buffer |
| `<leader>Da` | n | DBUI Add Connection |

Conexões salvas em `~/.local/share/nvim/db_ui`.

---

## REST client (Kulala)

`lua/plugins/rest.lua`. Carrega para filetypes `http` e `rest`.

| Atalho | Modo | Ação |
|---|---|---|
| `<leader>rs` | n | Send Request |
| `<leader>rt` | n | Toggle body / headers view |
| `<leader>rc` | n | Copy as cURL |
| `<leader>rn` | n | Próximo request no arquivo |
| `<leader>rp` | n | Request anterior no arquivo |
| `<leader>ri` | n | Inspect request |
| `<leader>rq` | n | Close Kulala |

---

## Testes (Neotest)

`lua/plugins/testing.lua`. Adapters: PHPUnit, Go.

| Atalho | Modo | Ação |
|---|---|---|
| `<leader>tt` | n | Rodar testes do arquivo atual |
| `<leader>tT` | n | Rodar todos os testes do projeto |
| `<leader>tr` | n | Rodar o teste mais próximo do cursor |
| `<leader>tl` | n | Rodar o último teste |
| `<leader>ts` | n | Toggle summary panel |
| `<leader>to` | n | Mostrar output do teste |
| `<leader>tO` | n | Toggle output panel |
| `<leader>tS` | n | Parar execução |
| `<leader>tw` | n | Toggle watch mode |

---

## Outline e marks (Aerial + Harpoon + Undotree)

### Aerial — outline (Structure view)

| Atalho | Modo | Ação |
|---|---|---|
| `<leader>cS` | n | Toggle Aerial |
| `<leader>cN` | n | Aerial Nav |
| `{` / `}` | n (no buffer) | Símbolo anterior / próximo |

### Harpoon — marks rápidas de arquivo

| Atalho | Modo | Ação |
|---|---|---|
| `<leader>ha` | n | Adicionar arquivo atual à lista |
| `<leader>hh` | n | Abrir menu Harpoon |
| `<leader>1` … `<leader>4` | n | Pular para slot 1..4 |
| `<leader>hn` / `<leader>hp` | n | Próximo / anterior |

### Undotree — histórico de undo (local history)

| Atalho | Modo | Ação |
|---|---|---|
| `<leader>uu` | n | Toggle Undotree |

---

## Yank history (Yanky)

`lua/plugins/qol.lua`. Storage: shada (persistente entre sessões).

| Atalho | Modo | Ação |
|---|---|---|
| `<leader>p` | n | Yank history (`:YankyRingHistory`) |
| `y` | n, x | Yank (com ring) |
| `p` / `P` | n, x | Put após / antes do cursor |
| `gp` / `gP` | n, x | Put após / antes da seleção |
| `]y` / `[y` | n | Ciclar próximo / anterior no histórico após paste |

---

## Diffview

Listados também na seção [Git](#git):

| Atalho | Modo | Ação |
|---|---|---|
| `<leader>gd` | n | Abrir diffview |
| `<leader>gD` | n | Fechar diffview |
| `<leader>gh` | n | Histórico do arquivo atual |
| `<leader>gH` | n | Histórico da branch |

---

## Which-key

Grupos visíveis em `<leader>` (configurados em `lua/plugins/ui.lua`):

| Prefixo | Grupo |
|---|---|
| `<leader>b` | buffer |
| `<leader>c` | code |
| `<leader>d` | debug |
| `<leader>f` | file/find |
| `<leader>g` | git |
| `<leader>h` | harpoon |
| `<leader>q` | quit/session |
| `<leader>r` | rest |
| `<leader>s` | search |
| `<leader>t` | test |
| `<leader>u` | ui |
| `<leader>w` | windows (proxy de `<C-w>`) |
| `<leader>x` | diagnostics/quickfix |
| `[` / `]` | prev / next |
| `g` | goto |

| Atalho | Ação |
|---|---|
| `<leader>?` | Mostrar keymaps locais ao buffer |
