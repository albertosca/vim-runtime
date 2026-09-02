🇺🇸 **English** · 🇧🇷 [Português](README.pt.md)

# Vim Setup (Vim 9.1+, with Neovim support)

[![CI](https://github.com/albertosca/vim-runtime/actions/workflows/test.yml/badge.svg)](https://github.com/albertosca/vim-runtime/actions/workflows/test.yml)
[![Lint](https://github.com/albertosca/vim-runtime/actions/workflows/lint.yml/badge.svg)](https://github.com/albertosca/vim-runtime/actions/workflows/lint.yml)

Professional setup for polyglot development: **Elixir/Phoenix, Ruby/Rails, JS/React/Node, Python, Go, Rust**.

CoC.nvim as the LSP client, fzf as unified search, and 375 automated tests. See [Credits](#credits).

**Also works on Neovim** (dual-boot, without duplicating any config) — native LSP, treesitter, telescope and more. See [`docs/neovim.md`](docs/neovim.md).

## Structure

```
configs.vim              ← main file — edit here
nvim/                     ← Neovim config (symlinked into ~/.config/nvim by install.sh)
vimrcs/
  options.vim            ← Vim options (set commands)
  filetypes.vim          ← filetype detection and per-language indent
  plugins.vim            ← Pathogen + third-party plugin config
  editor.vim             ← persistent undo, GUI, helpers
plugins/                 ← 51 plugins (Pathogen)
test/                    ← test suite (vader, jest, shell)
docs/                    ← documentation
  keybindings.md         ← complete keybinding cheatsheet (Vim and Neovim)
  neovim.md              ← architecture, plugins and solved bugs on the Neovim side
  test_plan.md           ← test plan and architecture
```

## Installation

> ⚠️ The repo **must** live at `~/.vim_runtime` — paths are hardcoded
> (sources, undodir). Use exactly the clone path below.

**Automatic (recommended):**

```bash
git clone https://github.com/albertosca/vim-runtime.git ~/.vim_runtime
bash ~/.vim_runtime/install.sh
```

> **Prerequisites:** Vim 9.1+, **Node.js** (without it CoC/LSP does not load),
> git and ripgrep. Detailed per-OS setup, first run and troubleshooting in
> **[docs/setup.md](docs/setup.md)**.

`install.sh` is idempotent and backs up whatever already exists. It initializes
the submodules one by one (resilient), creates `~/.vimrc` pointing to
`vimrc_example`, and links `coc-settings.json` into `~/.vim/coc-settings.json`.

**Alternative with `--recursive`** (submodules are healthy, works too):

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

`~/.vimrc` (via `vimrc_example`) loads in this order — the last definition wins:

```vim
source ~/.vim_runtime/autoload/pathogen.vim
call pathogen#infect('~/.vim_runtime/plugins/{}')
source ~/.vim_runtime/vimrcs/options.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins.vim
source ~/.vim_runtime/vimrcs/editor.vim
source ~/.vim_runtime/configs.vim
```

## Customizing (without touching the repo)

Want your own mappings, colorscheme or options **without editing versioned
files or forking**? Use the local extension point — it loads last, so it
overrides everything that came before:

```bash
cp ~/.vim_runtime/my_configs.vim.example ~/.vim_runtime/my_configs.vim
# edit ~/.vim_runtime/my_configs.vim and reload Vim
```

Prefer organizing by topic instead of a single file? Create a `my_configs/`
directory and drop in as many `.vim` files as you like — all are loaded in
alphabetical order:

```bash
mkdir -p ~/.vim_runtime/my_configs
# ~/.vim_runtime/my_configs/mappings.vim, .../colors.vim, etc.
```

`my_configs.vim` and `my_configs/` are **gitignored** — they never conflict on
`git pull`. Only `my_configs.vim.example` (versioned) and the docs ship, with
examples and the **keep it local vs. open a PR** criterion:

- **Keep it local** (yours only): mappings, colorscheme, taste options, machine paths.
- **Open a PR** (improves it for everyone): swap/add a plugin, fix a bug or a bad default.

## Plugins (51)

| Category | Plugins |
|---|---|
| **LSP / Completion** | coc.nvim (25 extensions), vim-snippets |
| **AI** | vim-claude-code, vim-ai-autocomplete |
| **Search** | fzf, fzf.vim |
| **Navigation** | NERDTree, vim-rooter, vim-projectionist, vim-rails, vim-tmux-navigator |
| **Git** | vim-fugitive, vim-gitgutter, gv.vim |
| **Editing** | vim-surround, auto-pairs, vim-visual-multi, vim-commentary, vim-endwise, vim-repeat, tabular, vim-expand-region, vim-indent-object, vim-unimpaired, vim-abolish, vim-closetag, vim-matchup, vim-sleuth, vim-which-key, vim-table-mode |
| **Testing** | vim-test, vimux |
| **Languages** | vim-elixir, vim-mix-format, vim-go, rust.vim, vim-jsx-improve, vim-js-pretty-template, vim-mdx-js, vim-markdown |
| **Database** | vim-dadbod, vim-dadbod-ui, vim-dadbod-completion |
| **UI** | lightline.vim, gruvbox, vim-devicons, vim-nerdtree-syntax-highlight, undotree, goyo.vim, vim-obsession, set_tabline |

> **Neovim** uses its own set of Lua plugins (`lazy.nvim`, outside this directory) — see [`docs/neovim.md`](docs/neovim.md) for the full inventory (native LSP, treesitter, telescope, DAP, etc.).

**Updating plugins:** see the guide at **[docs/updating-plugins.md](docs/updating-plugins.md)**.

## Keybindings

`mapleader` = `,` (comma). Complete cheatsheet at **[docs/keybindings.md](docs/keybindings.md)** (Vim and Neovim — sections 16+ are Neovim-only: native LSP, treesitter, DAP, flash/harpoon/trouble/diffview, etc.).

Highlights:

| Keys | Action |
|---|---|
| `Ctrl+f` | Find files (fzf) |
| `Ctrl+b` | Find buffers (fzf) |
| `K` | Documentation (CoC hover) |
| `gd` | Goto definition |
| `,tn` | Run test under cursor |
| `:A` | Toggle code/test |
| `,gv` | Navigable git log |
| `,db` | Database UI |

## CoC extensions

25 extensions installed automatically the first time Vim opens:

| Extension | Coverage |
|---|---|
| coc-elixir | Elixir LSP (ElixirLS) |
| coc-tsserver | TypeScript, JavaScript, React |
| coc-pyright | Python LSP |
| coc-go | Go LSP (gopls) |
| coc-css, coc-tailwindcss | CSS, Tailwind |
| coc-eslint, coc-prettier, coc-stylelint, coc-stylelintplus | Linting and formatting |
| coc-emmet | HTML/JSX expansion |
| coc-snippets | Snippets (vim-snippets) |
| coc-sql | SQL completion |
| coc-html, coc-json, coc-yaml, coc-xml, coc-sh | Markup and config |
| coc-git, coc-yank | Inline git, yank history |
| coc-docker, coc-browser, coc-markdownlint | Docker, browser APIs, markdown |
| coc-markdown-preview-enhanced, coc-webview | Markdown preview |

> Ruby and Rust do not ship with an LSP by default — see **[docs/setup.md](docs/setup.md)**.

## Tests

375 automated tests across 7 suites, running on every push in CI along with
lint (vint + luacheck):

```bash
bash test/run.sh          # compact — one line per suite
bash test/run.sh -v       # expanded — every case with check/X
bash test/run.sh -vv      # raw — full debugging
bash test/run.sh unit     # run a single suite
```

```
  Vim Config Test Suite
  ─────────────────────────────────────────────────────
  ✓  shell            65 passed  2 warn  0 failed
  ✓  unit             101 passed  0 failed
  ✓  integration      134 passed  0 failed
  ✓  e2e              19 passed  0 failed
  ✓  nvim-vader        5 passed  0 failed
  ✓  nvim-lua         23 passed  0 failed
  ✓  jest             28 passed  0 failed
  ─────────────────────────────────────────────────────
  ✓ 375 passed   all green
    2 warn
```

The AI autocomplete plugin keeps its own 366-test suite inside
[`plugins/vim-ai-autocomplete`](https://github.com/albertosca/vim-ai-autocomplete).
Test architecture details in **[docs/test_plan.md](docs/test_plan.md)**.

## Workflow tips

1. **Project navigation:** `,gf` (git files only) is faster than `Ctrl+f` on large projects
2. **Global search + replace:** `,rg word` → select with `Tab` → `:cfdo %s/old/new/g | update`
3. **Per-project sessions:** each project has its own `Session.vim`. Enter the directory and `vim` restores everything
4. **Inline blame:** `,gm` shows author, hash and commit message of the current line in a popup
5. **Fast diagnostics:** `]g` jumps to the next error, `,a` suggests an automatic fix
6. **Auto-save:** all buffers are saved when Vim loses focus (app/tmux pane switch)
7. **Automatic project root:** vim-rooter detects `.git`, `mix.exs`, `Gemfile`, `package.json` and `cd`s automatically

## Ecosystem

This config is part of a larger setup:

| Repo | What it is |
|---|---|
| **[albertosca/vim-runtime](https://github.com/albertosca/vim-runtime)** | This repo — Vim config with Pathogen + CoC |
| **[albertosca/tmux](https://github.com/albertosca/tmux)** | Companion tmux config |
| **[albertosca/vim-ai-autocomplete](https://github.com/albertosca/vim-ai-autocomplete)** | AI autocomplete (ghost-text, multi-model) — used by this repo as a submodule |

## Credits

This config started as a fork of **[amix/vimrc](https://github.com/amix/vimrc)** by [Amir Salihefendic](https://github.com/amix) — "The Ultimate Vim Configuration". Over time it gained CoC.nvim, fzf, automated tests and a structure of its own, until it diverged so much that keeping it as a fork no longer made sense. The base structure and early history come from the original project; the credits stay here.

## License

MIT
