# Neovim — Arquitetura e Referência

Este arquivo documenta como o Neovim convive com este mesmo `~/.vim_runtime`, o inventário completo de plugins/servidores adicionados, e os bugs reais encontrados durante a migração (pra não repetir o mesmo caminho se algo similar aparecer de novo).

Ver [`keybindings.md`](keybindings.md) pra todos os atalhos (seções 16+ são exclusivas do Neovim).

---

## Filosofia: dual-boot, zero duplicação

`~/.vim_runtime` continua sendo a **única fonte de verdade** pros dois editores. `~/.config/nvim/init.vim` não duplica nada — ele só:

1. Define `g:pathogen_disabled` (plugins vimscript que não fazem sentido/não funcionam no Neovim).
2. `source ~/.vimrc` — carrega `configs.vim`/`vimrcs/*.vim` normalmente, exatamente como o Vim faz.
3. Carrega a camada Lua exclusiva do Neovim (`lua/user/*.lua`).

### Os dois mecanismos de divergência

| Mecanismo | Quando usar | Exemplo |
| :--- | :--- | :--- |
| `g:pathogen_disabled` (lista no `init.vim`) | Plugin **inteiro** não deve carregar no Neovim | `coc.nvim`, `nerdtree`, `vim-gitgutter` |
| `if has('nvim') ... endif` (dentro de `configs.vim`/`vimrcs/*.vim`) | Só um **trecho** de config diverge, resto é igual | Seção inteira do CoC, `gruvbox_contrast_dark`, `undodir` |

Nenhum arquivo do Vim é duplicado pro Neovim — só ganham esses dois tipos de desvio, sempre comentados no próprio ponto onde acontecem.

### Namespace da config Lua

Tudo em `nvim/lua/user/*.lua` (dentro do `~/.vim_runtime`, symlinkado em `~/.config/nvim`; não `lua/*.lua` direto) — isso existe porque vários plugins têm um módulo Lua com o mesmo nome do arquivo que a gente escreveria (`nvim-dap` tem `lua/dap.lua`, `gitsigns.nvim` tem `lua/gitsigns.lua`). Um arquivo nosso `lua/dap.lua` se auto-referenciaria em `require('dap')` em vez de carregar o plugin — vira loop. Namespacear em `user/` elimina esse risco de vez.

---

## Plugin manager: lazy.nvim + Pathogen

Pathogen continua cuidando de tudo que é compartilhado com o Vim (`~/.vim_runtime/plugins/`). `lazy.nvim` cuida só do que é exclusivo do Neovim (`nvim/lua/user/plugins.lua`).

**Cuidado conhecido:** `lazy.nvim` reseta `&runtimepath` por padrão (otimização de performance) — isso apagaria tudo que o Pathogen carregou. Desligado explicitamente via `performance.rtp.reset = false` no `plugins.lua`.

**Atualizar:**

```vim
:Lazy sync     " plugins do lua/user/plugins.lua
:MasonUpdate   " LSP servers/DAP adapters/formatters/linters do mason
```

(A atualização dos plugins Pathogen/Vim continua em [`updating-plugins.md`](updating-plugins.md) — mecanismo separado.)

---

## Inventário de plugins (o que substitui o quê)

| Vim (Pathogen, mantido) | Neovim (lazy.nvim) | Nota |
| :--- | :--- | :--- |
| `coc.nvim` | `nvim-lspconfig` + `mason.nvim` + `mason-lspconfig` + `blink.cmp` | LSP nativo — ver tabela por linguagem abaixo |
| `nerdtree` + `vim-nerdtree-syntax-highlight` | `neo-tree.nvim` | Mesmos atalhos (`,nn`/`,nf`) |
| `vim-gitgutter` | `gitsigns.nvim` | `,d` toggle agora avisa ON/OFF |
| `lightline.vim` | `lualine.nvim` | Tema gruvbox |
| `vim-devicons` | `nvim-web-devicons` | Dependência do neo-tree/lualine |
| `vim-surround` | `nvim-surround` | Mesmos atalhos por padrão |
| `vim-commentary` | *(nenhum)* | `gc`/`gcc` nativos do Neovim ≥0.10 |
| `vim-snippets` + coc-snippets | `LuaSnip` + `friendly-snippets` | Fonte de snippet do `blink.cmp` |
| coc-yank | `yanky.nvim` | `,yn`/`,yp` cicla histórico |
| `vim-claude-code` | — | Sem equivalente (incompatível, `has('terminal')`). Copilot foi removido do setup inteiro em 2026-09-02 |
| `vim-which-key` | `which-key.nvim` | Parser do vimscript não lê o formato novo de `:map` do Neovim |
| `typescript-language-server` (`ts_ls`) | `typescript-tools.nvim` | Trocado por decisão explícita — mais rápido, fala direto com `tsserver` |

**Só Neovim, sem equivalente no Vim:**

`nvim-treesitter` (+ `-textobjects`, `-context`), `telescope.nvim`, `nvim-dap` (+ `-ui`, `-go`, `-python`, `-ruby`, `-vscode-js`), `render-markdown.nvim`, `glow.nvim`, `flash.nvim`, `harpoon2`, `trouble.nvim`, `diffview.nvim`, `venv-selector.nvim`.

**Compartilhado via port Lua (não é Pathogen, mas existe nos dois):**

`vim-ai-autocomplete` — autocomplete inline via Gemini/Claude (ghost text). Plugin próprio, com um port nativo em Lua pro Neovim (`,pt`/`,pr`/`,pm`/`:VimAiAutocompleteModel` — ver `docs/keybindings.md` seção 23) e a versão original em Vimscript pro Vim (seção 26). Substituiu o `minuet-ai.nvim`, removido de vez (usava `,ap`/`,at` e uma key em `~/.zsh_secrets`).

**Só Vim, adicionado durante a migração mas útil pros dois (Pathogen, compartilhado):**

`vim-which-key` (Vim usa a versão vimscript; Neovim usa `which-key.nvim`), `vim-table-mode` (puro vimscript, funciona idêntico nos dois — `,Mm`/`,Mr`).

---

## LSP por linguagem

| Linguagem | Servidor(es) | Pacote mason | Inlay hints |
| :--- | :--- | :--- | :--- |
| Elixir | `elixirls` | `elixir-ls` | Não suportado pelo servidor |
| Go | `gopls` | `gopls` | Sim |
| Python | `pyright` + `ruff` | `pyright`, `ruff` | **Não** (pyright OSS não suporta — só Pylance, fechado) |
| Ruby | `ruby_lsp` | `ruby-lsp` | — |
| JS/TS/React | `typescript-tools.nvim` (não é mason) | — | Sim (settings próprias do plugin) |
| HTML/CSS/JSON/YAML/XML | `html`, `cssls`, `jsonls`, `yamlls`, `lemminx` | idem | — |
| Bash | `bashls` | `bash-language-server` | — |
| SQL | `sqls` | `sqls` | — |
| Docker/Compose | `dockerls`, `docker_compose_language_service` | `dockerfile-language-server`, `docker-compose-language-service` | — |
| Tailwind | `tailwindcss` | `tailwindcss-language-server` | — |
| Emmet | `emmet_language_server` | `emmet-language-server` | — |
| ESLint | `eslint` | `eslint-lsp` | — |

**Formatters** (`conform.nvim`): `prettier` (JS/TS/CSS/HTML/JSON/YAML/MD). **Linters** (`nvim-lint`): `stylelint` (CSS/SCSS), `markdownlint-cli2` (MD).

`ruff` roda com `hoverProvider = false` — evita duplicar o hover do `pyright` no mesmo buffer.

---

## DAP por linguagem

| Linguagem | Plugin | Pré-requisito externo |
| :--- | :--- | :--- |
| Elixir | Embutido no `elixir-ls` (mesmo pacote do LSP) | Nenhum |
| Go | `nvim-dap-go` | `go install github.com/go-delve/delve/cmd/dlv@latest` |
| Python | `nvim-dap-python` | `debugpy` (mason instala sozinho) |
| Ruby | `nvim-dap-ruby` | `rdbg` (gem `debug`, Ruby ≥3.1 — ver seção Pendências) |
| JS/TS | `nvim-dap-vscode-js` | `js-debug-adapter` (mason instala sozinho) |

Atalhos: ver [`keybindings.md` seção 20](keybindings.md#20-dap-debugger--elixir-go-python-ruby-jsts).

---

## Testes

Dois frameworks, um pra cada tipo de conteúdo (ver [`test_plan.md`](test_plan.md) pra arquitetura completa):

- **`test/nvim/*.vader`** — roda sob `nvim --headless` usando o `nvim/init.vim` real (sistema completo montado, mesmo espírito da suite `integration`). Cobre os branches `has('nvim')` que já existem em `configs.vim`/`vimrcs/*.vim` e que a suite `vim` nunca alcança.
- **`test/nvim/*_spec.lua`** — plenary.nvim (busted-style), init mínimo (só plenary + `nvim/` no runtimepath, sem subir LSP/DAP/lazy.nvim inteiro). Cobre o que é Lua genuinamente complexo: `lsp.lua`, `dap.lua`, `treesitter.lua`, `flash.lua`, `harpoon.lua`, `trouble.lua`.

```bash
bash test/run.sh nvim-vader   # só a suite vader-sob-nvim
bash test/run.sh nvim-lua     # só os specs plenary
```

**Critério de cobertura:** módulo com lógica própria não-trivial (config custom, função nossa, keymap nosso) ganha spec. `require('plugin').setup({})` de uma linha sem nada custom não ganha.

---

## Bugs reais encontrados durante a migração

Histórico útil se algo parecido aparecer de novo — todos com causa raiz confirmada, não achismo:

| Sintoma | Causa raiz | Fix |
| :--- | :--- | :--- |
| `,` não mostrava o popup de atalhos | `vim-which-key` (vimscript) parseia texto de `:map`, não entende o formato novo do Neovim (keymaps Lua) — quebrava o popup inteiro | `vim-which-key` desligado no Neovim via `g:pathogen_disabled`; `which-key.nvim` assume |
| Erro ao salvar arquivo Elixir | `vim-mix-format` mexe em `&shellslash` (opção só-Vim) sem guardar por editor — mesmo bug que já existia no `vim-go` | Guardado com `has('nvim')`, igual o fix do vim-go |
| Enter depois de `(` imprimia `<SNR>NN_AutoPairsReturn` literal no buffer | `auto-pairs` reconstrói o `<CR>` concatenando texto com o mapping anterior — funciona com CoC (texto puro), quebra com `blink.cmp` (referência Lua interna) | `g:AutoPairsMapCR = 0` só no Neovim |
| Ícones quebrados/faltando no `nvim-web-devicons`/neo-tree/lualine | Fonte do terminal (`Droid Sans Mono Nerd Font`) era de 2019 — não tem os ícones novos | Trocada pra `JetBrainsMono Nerd Font` |
| "Incompatible undo file" ao abrir arquivo já editado no outro editor | Vim e Neovim têm formatos de undo file binários incompatíveis, compartilhavam o mesmo `undodir` | `undodir` separado (`temp_dirs/undodir-nvim`) |
| `gr` parou de ser `:tabprev` | LSP nativo mapeava `gr` pra references (buffer-local, sempre vence o mapping global) | Removido do `lsp.lua` — Neovim ≥0.11 já tem `grr` nativo pra isso |
| `Ctrl+n` parou de fazer multi-cursor (vim-visual-multi) | `yanky.nvim` remapeava `Ctrl+n`/`Ctrl+p` globalmente pro histórico de yank, carregando depois via Lua | Movido pra `,yn`/`,yp` |
| Cores do gruvbox mais vibrantes que no Vim | `termguicolors` liga só no Neovim dentro do tmux (RGB exato) vs paleta 256 cores aproximada do Vim | `g:gruvbox_contrast_dark = 'soft'` só no Neovim |
| Tabela markdown renderizada ficava larga/feia com célula grande | `render-markdown.nvim`: `pipe_table.cell = 'padded'` (padrão) estica toda coluna até a maior célula | Trocado pra `cell = 'raw'` |
| `glow.nvim` sem cor e sem contraste nas bordas da tabela | Spawna o `glow` via pipe (não pty) — o `glow` detecta e desliga cor | `CLICOLOR_FORCE=1` setado no processo do Neovim (herdado pelo filho) |
| `,cs` só copiava o nome do arquivo, não o caminho | `expand("%:t")` (tail) — não era bug do Neovim, sempre foi assim | Trocado pra `expand("%:.")` (relativo ao cwd) — vale pros dois editores |

---

## Pendências conhecidas (dependem do usuário, não da config)

- **Elixir rename**: `elixir-ls` genuinamente não suporta rename (`renameProvider=false`, confirmado via capabilities) — não é bug daqui. O projeto oficial "Expert" (fusão Next LS + Lexical + ElixirLS) deve resolver isso no futuro, sem ETA ainda.

> Ruby (`ruby-lsp`/`rdbg`) e Go (`delve`) já resolvidos — `/usr/local/opt/ruby/bin` e `$HOME/go/bin` estão no `PATH` (`~/.zshrc`), e o `dlv` já foi instalado via `go install`. `ruby-lsp` em si instala sozinho via mason na primeira abertura de um projeto Ruby real.

---

## Requisitos de sistema (Neovim)

Além dos requisitos do [`setup.md`](setup.md), o Neovim precisa de:

| Dependência | Pra quê | Instalação |
| :--- | :--- | :--- |
| Neovim 0.12+ | O editor | `brew install neovim` |
| `tree-sitter-cli` | Compilar os parsers do `nvim-treesitter` — **não vem** junto do `brew install neovim` | `brew install tree-sitter-cli` |
| Go | `gopls`, `sqls`, `nvim-dap-go` (via `go install`) | `brew install go` |
| Ruby ≥3.1 | `ruby-lsp`, `rdbg` (ver Pendências acima) | `brew install ruby` (keg-only — precisa do PATH manual) |
| Node.js | `typescript-tools.nvim`, `js-debug-adapter`, `eslint-lsp`, etc. | Já usado pelo CoC no Vim — mesmo Node |
| `GEMINI_API_KEY` (`~/.config/gemini/vim-ai-autocomplete.env`) / `ANTHROPIC_API_KEY` (`~/.config/anthropic/vim-ai-autocomplete.env`) | `vim-ai-autocomplete` (autocomplete inline Gemini/Claude, port Neovim — ver `docs/keybindings.md` seção 23) — precisa de pelo menos uma; 2+ habilitam o toggle `,pr`/`,pm` | Gemini: [aistudio.google.com](https://aistudio.google.com/apikey). Claude: [console.anthropic.com](https://console.anthropic.com/) (billing por API, diferente da assinatura do Claude Code) |
