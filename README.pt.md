🇺🇸 [English](README.md) · 🇧🇷 **Português**

# Vim Setup (Vim 9.1+, com suporte a Neovim)

[![CI](https://github.com/albertosca/vim-runtime/actions/workflows/test.yml/badge.svg)](https://github.com/albertosca/vim-runtime/actions/workflows/test.yml)
[![Lint](https://github.com/albertosca/vim-runtime/actions/workflows/lint.yml/badge.svg)](https://github.com/albertosca/vim-runtime/actions/workflows/lint.yml)

Setup profissional para desenvolvimento poliglota: **Elixir/Phoenix, Ruby/Rails, JS/React/Node, Python, Go, Rust**.

CoC.nvim como LSP client, fzf como busca unificada, e 373 testes automatizados. Veja [Créditos](#créditos).

**Funciona também no Neovim** (dual-boot, sem duplicar nenhuma config) — LSP nativo, treesitter, telescope e mais. Ver [`docs/neovim.md`](docs/neovim.md).

## Estrutura

```
configs.vim              ← arquivo principal — edite aqui
nvim/                     ← config Neovim (symlinkada em ~/.config/nvim pelo install.sh)
vimrcs/
  options.vim            ← opções do Vim (set commands)
  filetypes.vim          ← detecção de filetype e indent por linguagem
  plugins.vim            ← Pathogen + config de plugins terceiros
  editor.vim             ← undo persistente, GUI, helpers
plugins/                 ← 52 plugins (Pathogen)
test/                    ← suite de testes (vader, jest, shell)
docs/                    ← documentação
  keybindings.md         ← cheatsheet completo de atalhos (Vim e Neovim)
  neovim.md              ← arquitetura, plugins e bugs resolvidos do lado Neovim
  test_plan.md           ← plano e arquitetura de testes
```

## Instalação

> ⚠️ O repo **precisa** ficar em `~/.vim_runtime` — os paths são hardcoded
> (sources, undodir). Use exatamente o caminho do clone abaixo.

**Automática (recomendada):**

```bash
git clone https://github.com/albertosca/vim-runtime.git ~/.vim_runtime
bash ~/.vim_runtime/install.sh
```

> **Pré-requisitos:** Vim 9.1+, **Node.js** (sem ele o CoC/LSP não carrega),
> git e ripgrep. Setup detalhado por OS, primeiro run e troubleshooting em
> **[docs/setup.md](docs/setup.md)**.

O `install.sh` é idempotente e faz backup do que já existir. Ele inicializa
os submodules um a um (resiliente), cria `~/.vimrc` apontando para
`vimrc_example`, e linka `coc-settings.json` em `~/.vim/coc-settings.json`.

**Alternativa com `--recursive`** (submodules estão saudáveis, também funciona):

```bash
git clone --recursive https://github.com/albertosca/vim-runtime.git ~/.vim_runtime
bash ~/.vim_runtime/install.sh
```

**Manual:**

```bash
git clone https://github.com/albertosca/vim-runtime.git ~/.vim_runtime
git -C ~/.vim_runtime submodule update --init
ln -sf ~/.vim_runtime/vimrc_example ~/.vimrc
mkdir -p ~/.vim
ln -sf ~/.vim_runtime/coc-settings.json ~/.vim/coc-settings.json
```

O `~/.vimrc` (via `vimrc_example`) carrega nesta ordem — a última definição vence:

```vim
source ~/.vim_runtime/autoload/pathogen.vim
call pathogen#infect('~/.vim_runtime/plugins/{}')
source ~/.vim_runtime/vimrcs/options.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins.vim
source ~/.vim_runtime/vimrcs/editor.vim
source ~/.vim_runtime/configs.vim
```

## Personalizando (sem mexer no repo)

Quer seus próprios atalhos, colorscheme ou opções **sem editar arquivos
versionados nem forkar**? Use o ponto de extensão local — ele é carregado por
último, então sobrescreve tudo o que veio antes:

```bash
cp ~/.vim_runtime/my_configs.vim.example ~/.vim_runtime/my_configs.vim
# edite ~/.vim_runtime/my_configs.vim e recarregue o Vim
```

Prefere organizar por tema em vez de um arquivo só? Crie a pasta `my_configs/`
e solte quantos `.vim` quiser — todos são carregados em ordem alfabética:

```bash
mkdir -p ~/.vim_runtime/my_configs
# ~/.vim_runtime/my_configs/mappings.vim, .../colors.vim, etc.
```

`my_configs.vim` e `my_configs/` são **gitignored** — nunca conflitam no
`git pull`. Só o `my_configs.vim.example` (versionado) e a documentação, com
exemplos e o critério **fica local vs. abre PR**:

- **Fica local** (só seu): mappings, colorscheme, opções de gosto, paths da máquina.
- **Abre um PR** (melhora pra todos): trocar/adicionar um plugin, corrigir bug ou default ruim.

## Plugins (52)

| Categoria | Plugins |
|---|---|
| **LSP / Completion** | coc.nvim (25 extensões), vim-snippets |
| **IA** | copilot-chat.vim, vim-claude-code, vim-ai-autocomplete |
| **Busca** | fzf, fzf.vim |
| **Navegação** | NERDTree, vim-rooter, vim-projectionist, vim-rails, vim-tmux-navigator |
| **Git** | vim-fugitive, vim-gitgutter, gv.vim |
| **Edição** | vim-surround, auto-pairs, vim-visual-multi, vim-commentary, vim-endwise, vim-repeat, tabular, vim-expand-region, vim-indent-object, vim-unimpaired, vim-abolish, vim-closetag, vim-matchup, vim-sleuth, vim-which-key, vim-table-mode |
| **Testes** | vim-test, vimux |
| **Linguagens** | vim-elixir, vim-mix-format, vim-go, rust.vim, vim-jsx-improve, vim-js-pretty-template, vim-mdx-js, vim-markdown |
| **Database** | vim-dadbod, vim-dadbod-ui, vim-dadbod-completion |
| **UI** | lightline.vim, gruvbox, vim-devicons, vim-nerdtree-syntax-highlight, undotree, goyo.vim, vim-obsession, set_tabline |

> **Neovim** usa um conjunto de plugins Lua próprio (`lazy.nvim`, fora deste diretório) — ver [`docs/neovim.md`](docs/neovim.md) pro inventário completo (LSP nativo, treesitter, telescope, DAP, etc.).

**Atualizar plugins:** veja o guia em **[docs/updating-plugins.md](docs/updating-plugins.md)**.

## Atalhos

`mapleader` = `,` (vírgula). Cheatsheet completo em **[docs/keybindings.md](docs/keybindings.md)** (Vim e Neovim — seções 16+ são exclusivas do Neovim: LSP nativo, treesitter, DAP, flash/harpoon/trouble/diffview, etc.).

Destaques:

| Atalho | Ação |
|---|---|
| `Ctrl+f` | Buscar arquivos (fzf) |
| `Ctrl+b` | Buscar buffers (fzf) |
| `K` | Documentação (CoC hover) |
| `gd` | Goto definition |
| `,tn` | Rodar teste sob o cursor |
| `:A` | Alternar código/teste |
| `,gv` | Git log navegável |
| `,db` | Database UI |

## Extensões CoC

25 extensões instaladas automaticamente na primeira abertura do Vim:

| Extensão | Cobertura |
|---|---|
| coc-elixir | Elixir LSP (ElixirLS) |
| coc-tsserver | TypeScript, JavaScript, React |
| coc-pyright | Python LSP |
| coc-go | Go LSP (gopls) |
| coc-css, coc-tailwindcss | CSS, Tailwind |
| coc-eslint, coc-prettier, coc-stylelint, coc-stylelintplus | Linting e formatação |
| coc-emmet | Expansão HTML/JSX |
| coc-snippets | Snippets (vim-snippets) |
| coc-sql | SQL completion |
| coc-html, coc-json, coc-yaml, coc-xml, coc-sh | Markup e config |
| coc-git, coc-yank | Git inline, histórico de yanks |
| coc-docker, coc-browser, coc-markdownlint | Docker, browser APIs, markdown |
| coc-markdown-preview-enhanced, coc-webview | Preview de markdown |

> Ruby e Rust não vêm com LSP por padrão — veja **[docs/setup.md](docs/setup.md)**.

## Testes

373 testes automatizados em 7 suites, rodando a cada push no CI junto com o
lint (vint + luacheck):

```bash
bash test/run.sh          # compacto — uma linha por suite
bash test/run.sh -v       # expandido — cada caso com check/X
bash test/run.sh -vv      # raw — debug completo
bash test/run.sh unit     # rodar uma suite específica
```

```
  Vim Config Test Suite
  ─────────────────────────────────────────────────────
  ✓  shell            65 passed  2 warn  0 failed
  ✓  unit             101 passed  0 failed
  ✓  integration      134 passed  0 failed
  ✓  e2e              19 passed  0 failed
  ✓  nvim-vader        5 passed  0 failed
  ✓  nvim-lua         21 passed  0 failed
  ✓  jest             28 passed  0 failed
  ─────────────────────────────────────────────────────
  ✓ 373 passed   all green
    2 warn
```

O plugin de autocomplete de IA mantém a própria suite de 343 testes em
[`plugins/vim-ai-autocomplete`](https://github.com/albertosca/vim-ai-autocomplete).
Detalhes da arquitetura de testes em **[docs/test_plan.md](docs/test_plan.md)**.

## Dicas de Workflow

1. **Navegação por projeto:** `,gf` (só arquivos git) é mais rápido que `Ctrl+f` em projetos grandes
2. **Busca + substituição global:** `,rg palavra` → seleciona com `Tab` → `:cfdo %s/old/new/g | update`
3. **Sessão por projeto:** cada projeto tem seu `Session.vim`. Entre no diretório e `vim` restaura tudo
4. **Blame em linha:** `,gm` mostra autor, hash e mensagem do commit da linha atual em popup
5. **Diagnósticos rápidos:** `]g` pula pro próximo erro, `,a` sugere correção automática
6. **Auto-save:** todos os buffers são salvos ao sair do foco do Vim (troca de app/tmux pane)
7. **Raiz do projeto automática:** vim-rooter detecta `.git`, `mix.exs`, `Gemfile`, `package.json` e faz `cd` automático

## Ecossistema

Este config faz parte de um setup maior:

| Repo | O que é |
|---|---|
| **[albertosca/vim-runtime](https://github.com/albertosca/vim-runtime)** | Este repo — config Vim com Pathogen + CoC |
| **[albertosca/tmux](https://github.com/albertosca/tmux)** | Config tmux complementar |
| **[albertosca/vim-ai-autocomplete](https://github.com/albertosca/vim-ai-autocomplete)** | Autocomplete de IA (ghost-text, multi-modelo) — usado por este repo via submodule |

## Créditos

Este config começou como fork do **[amix/vimrc](https://github.com/amix/vimrc)** de [Amir Salihefendic](https://github.com/amix) — "The Ultimate Vim Configuration". Com o tempo foi ganhando CoC.nvim, fzf, testes automatizados e estrutura própria, até divergir tanto que não fazia mais sentido manter como fork. A estrutura base e o histórico inicial vêm do projeto original; os créditos ficam aqui.

## Licença

MIT
