# Vim Config — Guide for AI

Professional Vim 9.1+ setup for polyglot development (Elixir/Phoenix, Ruby/Rails, JS/React/Node, Python, Go, Rust).

## Repository layout

```
configs.vim              ← MAIN FILE — every personal customisation
vimrcs/
  options.vim            ← Vim options (set commands, search, indent, UI)
  filetypes.vim          ← filetype detection and per-language indent
  plugins.vim            ← Pathogen loading + third-party plugin config
  editor.vim             ← persistent undo, GUI, helpers, VisualSelection
plugins/                 ← 51 plugins (managed by Pathogen, NOT vim-plug/lazy)
coc-settings.json        ← CoC config — install.sh symlinks it into ~/.vim/
my_configs.vim           ← local extension point (gitignored, loaded LAST)
autoload/pathogen.vim    ← plugin manager
colors/                  ← extra colorschemes (gruvbox is the active one, it lives in plugins/)
test/                    ← test suite (vader, jest, shell) — see docs/test_plan.md
docs/                    ← documentation (keybindings, test plan)
nvim/                    ← Neovim config (init.vim, lua/user/*.lua) — symlinked into ~/.config/nvim by install.sh
test/nvim/               ← Neovim-only tests: *.vader runs under `nvim --headless` (full init.vim), *_spec.lua runs through plenary.nvim (minimal init)
temp_dirs/undodir/       ← persistent undo (automatic cleanup after 90 days)
```

## Load order

`~/.vimrc` loads in this order — **the last definition wins**:

1. `vimrcs/options.vim` — defaults (shiftwidth=4, no colorscheme, etc.)
2. `vimrcs/filetypes.vim` — filetype detection
3. `vimrcs/plugins.vim` — Pathogen + config for NERDTree, lightline, Goyo, vim-go, gitgutter, grepprg
4. `vimrcs/editor.vim` — undo, GUI, command-line helpers
5. `configs.vim` — **overrides everything above** (shiftwidth=2, gruvbox colorscheme, CoC, fzf, mappings)

Plugin `plugin/*.vim` files are sourced by Vim **after** the whole vimrc. To keep plugins from overriding mappings, use global variables (e.g. `g:ctrlp_map`) set BEFORE Pathogen loads.

## Mandatory conventions

- **Always use `nnoremap`** instead of `map` for normal-mode mappings (avoids visual-mode leaks and recursion)
- **Always wrap autocmds in an `augroup`** with `autocmd!` (avoids duplication when re-sourcing)
- **Never use `set option!`** (toggle) at global scope — use an explicit value (`set nohlsearch`)
- **configs.vim is the file to edit** — vimrcs/ are base layers inherited from amix/vimrc
- **Tests exist and must pass** — run `bash test/run.sh` before finishing any change
- **This repo is public: everything in it is written in English**, except `README*` and `docs/`, which may be bilingual

## Test suite

```bash
bash test/run.sh          # compact — one line per suite
bash test/run.sh -v       # expanded — every case with ✓/✗
bash test/run.sh -vv      # raw — debugging
bash test/run.sh unit     # a single suite (unit, integration, e2e, json, shell, nvim-vader, nvim-lua)
```

| Suite | Tool | What it covers |
|---|---|---|
| shell | bash | Presence of plugins and binaries, integrity |
| unit | vader.vim | Variables, options, VimScript functions |
| integration | vader.vim | Mappings, autocmds, filetypes, startup |
| e2e | vader.vim | feedkeys (auto-pairs, surround, rooter) |
| nvim-vader | vader.vim | Neovim-only cases under the full init.vim |
| nvim-lua | plenary.nvim | Neovim Lua modules under a minimal init |
| json | Node.js/jest | coc-settings.json (schema, types, values) |

## Lint — runs in CI, run it before finishing

```bash
luacheck nvim/lua/                        # config Lua (.luacheckrc)
vint configs.vim vimrcs/ nvim/init.vim    # Vimscript (.vintrc.yaml)
```

`vint` imports `pkg_resources`, removed from setuptools >= 81 — install it in a venv with `pip install vim-vint 'setuptools<81'`. Every disabled policy in `.vintrc.yaml` carries its reason; one works around a vint bug where state leaks between files in a multi-file run (each file passes alone, the batch does not).

### The `vim-ai-autocomplete` submodule has its OWN suite

`bash test/run.sh` at the root does **not** run the plugin's tests — those are ~378 separate cases. When touching the plugin, run both suites before finishing:

```bash
cd plugins/vim-ai-autocomplete && bash test/run.sh   # vader (Vim) + plenary (Neovim)
```

- First time: run `git submodule update --init --recursive` inside the plugin — `test/vendor/{vader.vim,plenary.nvim}` ship empty and the runner hangs without them.
- Use `PlenaryBustedDirectory` (what the runner and CI use); `PlenaryBustedFile` runs in-process and can report a different result.
- A change to the plugin means **2 commits**: one in the submodule, one at the root bumping the pointer.
- `~/Programming/vim-ai-autocomplete` is a symlink to `plugins/vim-ai-autocomplete` (same repository).
- **Rendering** bugs (ghost text, virtual text, cursor position) cannot be verified headlessly: they need a real pty — `tmux new-session -d`, `tmux capture-pane -p`, `tmux display-message -p '#{cursor_x},#{cursor_y}'`.
- The plugin has its own lint too: `luacheck lua/ test/nvim/` and `vint autoload/ plugin/`, both green in its CI.
- Its `test/minimal_vimrc.vim` sets `packpath` to `$VIMRUNTIME` on purpose — native packages under `~/.vim/pack` load on ANY Vim start and have spawned external processes during test runs.

## Writing tests — non-obvious rules

- **Vader's `Before:`/`After:` are sticky and apply to the blocks that FOLLOW them**, never to the preceding one (verified: an `After:` declared between two blocks does not fire for the first). Declaring cleanup after a block leaks it into the next test — one such leak wiped Vader's own workbench and killed the whole run with E86.
- **`exists('*autoload#fn')` never triggers autoload** (verified: 0 before the first call, 1 after). To detect an optional autoloaded function, CALL it inside `try` and catch `E117` — otherwise the check stays blind until something else happens to load the script.
- **Redirect stdin when running Vim/Neovim from a script or agent** (`vim ... </dev/null`): without it a non-headless Vim can wait forever on a prompt — a 0.08s suite hung for 5 minutes this way.

## Gotchas

- **Two Vim binaries**: `/usr/bin/vim` (Apple 9.1.1752) comes BEFORE `/opt/homebrew/bin/vim` (9.2) in PATH, and they differ on regex — inside `substitute()`, `[^\n]*` matches across line breaks on Apple's build and not on brew's. A suite that was green yesterday can fail today with no code change: check `which vim` and run both before hunting a regression.
- **`my_configs.vim` / `my_configs/`** are the local extension point, loaded last and gitignored — personal settings go there, never in `configs.vim`.

## Plugins — management

- **Manager**: Pathogen (NOT vim-plug, NOT lazy.nvim)
- **Directory**: `plugins/` — each subdirectory is a plugin
- **Submodules**: 34 plugins are git submodules (`.gitmodules`), the rest are embedded
- **Updating**: see `docs/updating-plugins.md`

## LSP

- CoC.nvim is the LSP client — `coc-settings.json` lives HERE, at the repo root; `install.sh` symlinks it to `~/.vim/coc-settings.json`
- 25 CoC extensions listed in `g:coc_global_extensions` in configs.vim
- CI fixture in `test/fixtures/coc-settings.json`

## What NOT to do

- Do not add `map` (use `nnoremap`)
- Do not create autocmds outside augroups
- Do not edit vimrcs/ for new features (use configs.vim)
- Do not remove plugins without updating the tests (`test/integration/cleanup.vader`)
- Do not commit `test/node/node_modules/` or `temp_dirs/undodir/*`
- Do not use `set option!` (toggle) at global scope
- **Never bring GitHub Copilot back** (Alberto, 2026-09-02). It was removed from the whole setup: merely being installed made it spawn `@github/copilot-language-server` through npx on every editor start, test runs included — one keychain prompt each time, and denying it thrashed the machine. NV-005, `test/nvim/copilot_off_spec.lua` and IT-152/155/156 assert its absence; `g:loaded_copilot = 1` stays as a tripwire.
