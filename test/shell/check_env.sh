#!/usr/bin/env bash
# Suite de testes de shell — IT-001 a IT-020, IT-086, IT-087, IT-090 a IT-094
# Uso: bash test/shell/check_env.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
PLUGINS="$REPO_ROOT/plugins"
PASS=0; FAIL=0; WARN=0

pass() { echo "  PASS  $1"; PASS=$((PASS + 1)); }
fail() { echo "  FAIL  $1"; FAIL=$((FAIL + 1)); }
warn() { echo "  WARN  $1"; WARN=$((WARN + 1)); }

plugin_file() {
  # plugin_file "vim-rails" "plugin/rails.vim"
  local dir="$PLUGINS/$1" file="$PLUGINS/$1/$2"
  if   [ ! -d "$dir"  ]; then fail "[$1] diretório ausente: $dir"
  elif [ ! -f "$file" ]; then fail "[$1] arquivo principal ausente: $2"
  else pass "[$1] $2"
  fi
}

require_bin() {
  # require_bin "git" ">=2" (versão é só informativa por enquanto)
  local bin="$1" label="${2:-}"
  if command -v "$bin" > /dev/null 2>&1; then
    local ver
    ver=$("$bin" --version 2>&1 | head -1 || true)
    pass "binário '$bin' disponível ($ver)"
  else
    fail "binário '$bin' não encontrado no PATH${label:+ — necessário para $label}"
  fi
}

optional_bin() {
  local bin="$1" label="${2:-}"
  if command -v "$bin" > /dev/null 2>&1; then
    pass "binário opcional '$bin' disponível"
  else
    warn "binário opcional '$bin' não encontrado${label:+ — $label}"
  fi
}

# ── IT-087: Isolamento XDG ─────────────────────────────────────────────────────
echo "── IT-087: Isolamento XDG ──────────────────────────────────────────────"
if [ -n "${XDG_DATA_HOME:-}" ] && [ -d "${XDG_DATA_HOME:-}" ]; then
  pass "XDG_DATA_HOME isolado em $XDG_DATA_HOME"
else
  warn "XDG_DATA_HOME não está isolado (rodar via test/run.sh para isolamento completo)"
fi

# ── IT-001: Nenhum diretório de plugin está vazio ──────────────────────────────
echo ""
echo "── IT-001: Integridade geral dos plugins ───────────────────────────────"
empty_count=0
for dir in "$PLUGINS"/*/; do
  name=$(basename "$dir")
  # Ignora arquivos soltos que aparecem no diretório
  [ -d "$dir" ] || continue
  count=$(find "$dir" -maxdepth 1 -type f -o -type d | grep -c . || true)
  if [ "$count" -le 1 ]; then
    fail "plugin vazio: $name"
    empty_count=$((empty_count + 1))
  fi
done
[ "$empty_count" -eq 0 ] && pass "nenhum diretório de plugin está vazio"
plugin_count=$(find "$PLUGINS" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')
pass "$plugin_count diretórios de plugins encontrados"

# ── IT-002 a IT-014: Plugins críticos ─────────────────────────────────────────
echo ""
echo "── IT-002 a IT-014: Plugins críticos ───────────────────────────────────"
plugin_file "vim-rails"              "plugin/rails.vim"
plugin_file "vim-projectionist"      "plugin/projectionist.vim"
plugin_file "fzf"                    "plugin/fzf.vim"
plugin_file "fzf.vim"                "plugin/fzf.vim"
plugin_file "vim-dadbod"             "plugin/dadbod.vim"
plugin_file "vim-dadbod-ui"          "plugin/db_ui.vim"
plugin_file "vim-dadbod-completion"  "plugin/vim_dadbod_completion.vim"
plugin_file "undotree"               "plugin/undotree.vim"
plugin_file "vim-obsession"          "plugin/obsession.vim"
plugin_file "gv.vim"                 "plugin/gv.vim"
plugin_file "vim-unimpaired"         "plugin/unimpaired.vim"
plugin_file "vim-rooter"             "plugin/rooter.vim"
plugin_file "vim-test"               "plugin/test.vim"
plugin_file "vimux"                  "plugin/vimux.vim"
plugin_file "vim-surround"           "plugin/surround.vim"
plugin_file "vim-fugitive"           "plugin/fugitive.vim"
plugin_file "vim-gitgutter"          "plugin/gitgutter.vim"
plugin_file "auto-pairs"             "plugin/auto-pairs.vim"
plugin_file "nerdtree"               "plugin/NERD_tree.vim"
plugin_file "vim-tmux-navigator"     "plugin/tmux_navigator.vim"
plugin_file "vim-which-key"          "plugin/which_key.vim"
plugin_file "vim-table-mode"         "plugin/table-mode.vim"

# vim-snippets: verifica que tem snippets, não só o diretório
snippets_count=$(find "$PLUGINS/vim-snippets/snippets" -name "*.snippets" 2>/dev/null | wc -l | tr -d ' ')
if [ "${snippets_count:-0}" -gt 10 ]; then
  pass "[vim-snippets] $snippets_count arquivos .snippets"
else
  fail "[vim-snippets] snippets/: esperava >10 arquivos, encontrou ${snippets_count:-0}"
fi

# coc.nvim: build compilado
if [ -f "$PLUGINS/coc.nvim/build/index.js" ] && [ -s "$PLUGINS/coc.nvim/build/index.js" ]; then
  pass "[coc.nvim] build/index.js presente e não vazio"
else
  fail "[coc.nvim] build/index.js ausente ou vazio — rode: cd plugins/coc.nvim && npm ci"
fi

# ── IT-015 a IT-020: Binários externos obrigatórios ───────────────────────────
echo ""
echo "── IT-015 a IT-020: Binários externos ──────────────────────────────────"
require_bin "node"    "coc.nvim"
require_bin "rg"      "fzf + Ack backend"
require_bin "git"     "vim-fugitive / gv.vim / GitMessenger"
require_bin "ruby"    "coc-solargraph"
require_bin "python3" "coc-pyright"

# ElixirLS (IT-018)
ELIXIRLS="$HOME/.elixir-ls/release/language_server.sh"
if [ -f "$ELIXIRLS" ] && [ -x "$ELIXIRLS" ]; then
  pass "ElixirLS em $ELIXIRLS (executável)"
else
  fail "ElixirLS não encontrado ou não executável em $ELIXIRLS"
fi

# ── IT-086: Tabela plugin → binário ───────────────────────────────────────────
echo ""
echo "── IT-086: Mapeamento plugin → binário ─────────────────────────────────"
require_bin "fzf"  "plugin fzf"
# rg e git já verificados acima; node também
# DB clients são opcionais
optional_bin "psql" "vim-dadbod com PostgreSQL"
optional_bin "mysql" "vim-dadbod com MySQL"

# ── IT-088: Configurações críticas ───────────────────────────────────────────
echo ""
echo "── IT-088: Configurações críticas ──────────────────────────────────────"
PLUGINS_VIM="$REPO_ROOT/vimrcs/plugins.vim"
if grep -q 'NERDTreeWinPos.*=.*"left"' "$PLUGINS_VIM"; then
  pass "NERDTree abre à esquerda (NERDTreeWinPos = \"left\")"
else
  fail "NERDTreeWinPos não está como \"left\" em vimrcs/plugins.vim — risco de regressão"
fi

# ── IT-089: Bootstrap de instalação do zero ──────────────────────────────────
echo ""
echo "── IT-089: Instalação do zero (vimrc_example + install.sh) ──────────────"

VIMRC_EXAMPLE="$REPO_ROOT/vimrc_example"
if [ -f "$VIMRC_EXAMPLE" ]; then
  pass "vimrc_example existe (template do ~/.vimrc)"
  # Deve carregar pathogen + as 4 camadas base + configs.vim, nesta ordem.
  ok=1
  for src in autoload/pathogen.vim vimrcs/options.vim vimrcs/filetypes.vim \
             vimrcs/plugins.vim vimrcs/editor.vim configs.vim; do
    grep -q "$src" "$VIMRC_EXAMPLE" || { fail "vimrc_example não carrega $src"; ok=0; }
  done
  [ "$ok" -eq 1 ] && pass "vimrc_example carrega pathogen + 4 camadas + configs.vim"
else
  fail "vimrc_example ausente — README manda 'ln -sf ~/.vim_runtime/vimrc_example ~/.vimrc'"
fi

INSTALL_SH="$REPO_ROOT/install.sh"
if [ -f "$INSTALL_SH" ]; then
  pass "install.sh existe"
  [ -x "$INSTALL_SH" ] && pass "install.sh é executável" \
                       || fail "install.sh não é executável (chmod +x)"
  bash -n "$INSTALL_SH" && pass "install.sh tem sintaxe válida" \
                        || fail "install.sh tem erro de sintaxe"
  grep -q 'submodule update --init' "$INSTALL_SH" \
    && pass "install.sh inicializa submodules" \
    || fail "install.sh não inicializa submodules"
  grep -q 'coc-settings.json' "$INSTALL_SH" \
    && pass "install.sh linka coc-settings.json" \
    || fail "install.sh não linka coc-settings.json"
else
  fail "install.sh ausente — README documenta 'bash ~/.vim_runtime/install.sh'"
fi

# ── IT-090: install.sh comportamento real ─────────────────────────────────────
echo ""
echo "── IT-090: install.sh comportamento real ────────────────────────────────"

# Cria HOME temporário com install.sh + arquivos mínimos + .gitmodules fictício
_setup_fake_home() {
  local fh
  fh=$(mktemp -d)
  local r="$fh/.vim_runtime"
  mkdir -p "$r/bin_stub"
  cp "$INSTALL_SH" "$r/install.sh"
  printf '# vimrc_example stub\n' > "$r/vimrc_example"
  printf '{}' > "$r/coc-settings.json"
  printf '[submodule "plugins/mod-ok"]\n  path = plugins/mod-ok\n  url = https://x/mod-ok\n[submodule "plugins/mod-dead"]\n  path = plugins/mod-dead\n  url = https://x/mod-dead\n' > "$r/.gitmodules"
  echo "$fh"
}

# IT-090a: caminho errado → exit 1 com mensagem "exige"
_h=$(mktemp -d)
cp "$INSTALL_SH" "$_h/"
_out=$(HOME="$_h" bash "$_h/install.sh" 2>&1) && _rc=0 || _rc=$?
rm -rf "$_h"
[ "$_rc" -ne 0 ] && echo "$_out" | grep -q "exige" \
  && pass "IT-090a: path errado → exit 1 + mensagem 'exige'" \
  || fail "IT-090a: esperava exit 1 + 'exige', obteve exit=$_rc"

# IT-090b: happy path — todos os submodules ok
_h=$(_setup_fake_home)
cat > "$_h/.vim_runtime/bin_stub/git" << 'EOF'
#!/usr/bin/env bash
while [[ "$1" == "-C" ]]; do shift 2; done
if echo "$@" | grep -q "get-regexp"; then
  echo "submodule.plugins/mod-ok.path plugins/mod-ok"
  echo "submodule.plugins/mod-dead.path plugins/mod-dead"
elif echo "$@" | grep -q "config.*url"; then
  echo "https://x/stub"
fi
exit 0
EOF
chmod +x "$_h/.vim_runtime/bin_stub/git"
_out=$(HOME="$_h" PATH="$_h/.vim_runtime/bin_stub:$PATH" bash "$_h/.vim_runtime/install.sh" 2>&1) && _rc=0 || _rc=$?
rm -rf "$_h"
[ "$_rc" -eq 0 ] && echo "$_out" | grep -q "Submodules atualizados" \
  && pass "IT-090b: happy path → 'Submodules atualizados', exit 0" \
  || fail "IT-090b: esperava exit 0 + 'Submodules atualizados', exit=$_rc"

# IT-090c: um submodule falha → avisa (ignorado) e não aborta
_h=$(_setup_fake_home)
cat > "$_h/.vim_runtime/bin_stub/git" << 'EOF'
#!/usr/bin/env bash
while [[ "$1" == "-C" ]]; do shift 2; done
if echo "$@" | grep -q "get-regexp"; then
  echo "submodule.plugins/mod-ok.path plugins/mod-ok"
  echo "submodule.plugins/mod-dead.path plugins/mod-dead"
elif echo "$@" | grep -q "submodule update.*mod-dead"; then
  exit 1
elif echo "$@" | grep -q "config.*url"; then
  echo "https://x/stub"
fi
exit 0
EOF
chmod +x "$_h/.vim_runtime/bin_stub/git"
_out=$(HOME="$_h" PATH="$_h/.vim_runtime/bin_stub:$PATH" bash "$_h/.vim_runtime/install.sh" 2>&1) && _rc=0 || _rc=$?
rm -rf "$_h"
echo "$_out" | grep -q "ignorado" \
  && pass "IT-090c: submodule morto → aviso 'ignorado' emitido" \
  || fail "IT-090c: esperava 'ignorado' no output"
[ "$_rc" -eq 0 ] \
  && pass "IT-090c: script não abortou após falha de submodule" \
  || fail "IT-090c: script abortou (exit $_rc) — deveria continuar"

# IT-090d: git indisponível → warning sobre git ausente
_h=$(_setup_fake_home)
_out=$(HOME="$_h" PATH="/usr/bin:/bin" bash "$_h/.vim_runtime/install.sh" 2>&1) && _rc=0 || _rc=$?
rm -rf "$_h"
echo "$_out" | grep -qE "ausente|pulei" \
  && pass "IT-090d: git ausente → warning emitido" \
  || fail "IT-090d: esperava 'ausente' ou 'pulei' no output"

# ── IT-091: install.sh faz pre-flight de dependências ─────────────────────────
echo ""
echo "── IT-091: install.sh pre-flight de dependências ───────────────────────"

# Pre-flight deve AVISAR (não abortar) quando node falta. Rodamos com um PATH
# que tem git (pra passar do path-check) mas sem node, em fake home no caminho certo.
_h=$(_setup_fake_home)
cat > "$_h/.vim_runtime/bin_stub/git" << 'EOF'
#!/usr/bin/env bash
while [[ "$1" == "-C" ]]; do shift 2; done
if echo "$@" | grep -q "get-regexp"; then echo "submodule.plugins/mod-ok.path plugins/mod-ok"; fi
exit 0
EOF
chmod +x "$_h/.vim_runtime/bin_stub/git"
# HOME aponta para fake home; install.sh roda de $HOME/.vim_runtime (path certo).
_out=$(HOME="$_h" PATH="$_h/.vim_runtime/bin_stub:/usr/bin:/bin" bash "$_h/.vim_runtime/install.sh" 2>&1) && _rc=0 || _rc=$?
rm -rf "$_h"
echo "$_out" | grep -qiE "node.*aus|node.*não|node.*nao|node.*instale" \
  && pass "IT-091a: node ausente → pre-flight avisa" \
  || fail "IT-091a: esperava aviso sobre node ausente no output"
[ "$_rc" -eq 0 ] \
  && pass "IT-091b: pre-flight não aborta quando falta dependência" \
  || fail "IT-091b: install.sh abortou (exit $_rc) — pre-flight deve só avisar"

# ── IT-092: customizações locais (my_configs.vim) ────────────────────────────
echo ""
echo "── IT-092: ponto de extensão local (my_configs.vim) ────────────────────"

# IT-092a: o arquivo de exemplo (documentação viva) é versionado
[ -f "$REPO_ROOT/my_configs.vim.example" ] \
  && pass "IT-092a: my_configs.vim.example existe na raiz" \
  || fail "IT-092a: my_configs.vim.example ausente"

# IT-092b: configs.vim carrega my_configs.vim e a pasta my_configs/ por último
if grep -q "my_configs.vim" "$REPO_ROOT/configs.vim" \
   && grep -q "my_configs/\*.vim" "$REPO_ROOT/configs.vim"; then
  pass "IT-092b: configs.vim sourça my_configs.vim e my_configs/*.vim"
else
  fail "IT-092b: loop de source de my_configs ausente em configs.vim"
fi

# IT-092c: .gitignore ignora o arquivo e a pasta locais
if grep -qx "my_configs.vim" "$REPO_ROOT/.gitignore" \
   && grep -qx "my_configs/" "$REPO_ROOT/.gitignore"; then
  pass "IT-092c: .gitignore ignora my_configs.vim e my_configs/"
else
  fail "IT-092c: .gitignore não ignora my_configs.vim e/ou my_configs/"
fi

# IT-092d: o exemplo versionado não é, ele próprio, ignorado por engano
if command -v git > /dev/null 2>&1; then
  if git -C "$REPO_ROOT" check-ignore -q my_configs.vim.example 2>/dev/null; then
    fail "IT-092d: my_configs.vim.example está sendo ignorado pelo .gitignore"
  else
    pass "IT-092d: my_configs.vim.example não é ignorado (continua versionado)"
  fi
else
  warn "IT-092d: git ausente — pulei a checagem de ignore do exemplo"
fi

# IT-092e: o exemplo é VimScript válido — sourcea sem erro E em vim headless
if command -v vim > /dev/null 2>&1; then
  _out=$(vim -N -u NONE -i NONE -es \
    -c "try | source $REPO_ROOT/my_configs.vim.example | catch | echom 'ERRO:' . v:exception | endtry" \
    -c "qa!" 2>&1) || true
  if echo "$_out" | grep -qiE "^ERRO:|E[0-9]+:"; then
    fail "IT-092e: my_configs.vim.example não sourcea limpo: $_out"
  else
    pass "IT-092e: my_configs.vim.example sourcea sem erro"
  fi
else
  warn "IT-092e: vim ausente — pulei a checagem de source do exemplo"
fi

# ── IT-093: carga FUNCIONAL do override local (cadeia real vimrc_example) ─────
echo ""
echo "── IT-093: override local carrega de fato (vimrc_example) ──────────────"

# Cria fixtures reais em ~/.vim_runtime e sobe o Vim pela mesma cadeia que o
# install.sh dá ao usuário. PULA se já existir config local — não sobrescreve
# dado do usuário (my_configs.vim/ são gitignored e podem ser dele).
_LF="$REPO_ROOT/my_configs.vim"
_LD="$REPO_ROOT/my_configs"
if [ -e "$_LF" ] || [ -e "$_LD" ]; then
  warn "IT-093: já existe my_configs local — pulei testes funcionais (não sobrescrevo)"
elif ! command -v vim > /dev/null 2>&1; then
  warn "IT-093: vim ausente — pulei testes funcionais"
else
  # Arquivo único: marcador, SOBRESCREVE um valor de configs.vim, registra um
  # atalho novo (<F8>) e SOBRESCREVE um atalho da base (<leader>e do editor.vim).
  {
    printf 'let g:tt_single = 1\n'
    printf 'let g:claude_code_split_ratio = 0.99\n'
    printf "let g:tt_precedence = 'file'\n"
    printf "nnoremap <F8> :echo 'new-map'<CR>\n"
    printf "nnoremap <leader>e :echo 'override-won'<CR>\n"
  } > "$_LF"
  # Pasta: 01 antes de 02 (ambos setam g:tt_order → 02 vence); 03 sobrescreve
  # g:tt_precedence do arquivo único (a pasta carrega DEPOIS do my_configs.vim).
  mkdir -p "$_LD"
  printf "let g:tt_glob = 1\nlet g:tt_order = 'first'\n"  > "$_LD/01_first.vim"
  printf "let g:tt_order = 'second'\n"                    > "$_LD/02_second.vim"
  printf "let g:tt_precedence = 'dir'\n"                  > "$_LD/03_precedence.vim"

  # Comando numa linha só: continuação com '\' não vale em argumento -c do Vim.
  # mapleader resolvido em runtime (default ',') para consultar o <leader>e.
  _cmd='call writefile(["RESULT single=".get(g:,"tt_single",0)." glob=".get(g:,"tt_glob",0)." order=".get(g:,"tt_order","none")." ratio=".printf("%.2f",get(g:,"claude_code_split_ratio",-1))." precedence=".get(g:,"tt_precedence","none")." newmap=<".maparg("<F8>","n")."> overmap=<".maparg(get(g:,"mapleader",",")."e","n").">"], "/dev/stderr")'
  _out=$(timeout 30 vim -N -u "$REPO_ROOT/vimrc_example" -i NONE -es \
    -c "$_cmd" \
    -c 'qa!' < /dev/null 2>&1) || true

  # Limpa as fixtures imediatamente (antes das asserções)
  rm -f "$_LF"; rm -rf "$_LD"

  if ! echo "$_out" | grep -q "RESULT "; then
    fail "IT-093: Vim não produziu resultado (cadeia não carregou?): $_out"
  else
    echo "$_out" | grep -q "single=1" \
      && pass "IT-093a: my_configs.vim (arquivo único) carrega" \
      || fail "IT-093a: my_configs.vim não carregou — $_out"
    echo "$_out" | grep -q "glob=1" \
      && pass "IT-093b: my_configs/*.vim (pasta) carrega" \
      || fail "IT-093b: my_configs/ não carregou — $_out"
    echo "$_out" | grep -q "order=second" \
      && pass "IT-093c: ordem alfabética — 02 vence 01" \
      || fail "IT-093c: ordem de carga errada — $_out"
    echo "$_out" | grep -q "ratio=0.99" \
      && pass "IT-093d: override de opção/var vence configs.vim (0.4 -> 0.99)" \
      || fail "IT-093d: override não venceu configs.vim — $_out"
    echo "$_out" | grep -q "override-won" \
      && pass "IT-093e: atalho local sobrescreve mapping da base (<leader>e)" \
      || fail "IT-093e: override de mapping não venceu — $_out"
    echo "$_out" | grep -q "new-map" \
      && pass "IT-093f: atalho novo do usuário (<F8>) é registrado" \
      || fail "IT-093f: mapping novo não foi registrado — $_out"
    echo "$_out" | grep -q "precedence=dir" \
      && pass "IT-093g: my_configs/*.vim sobrescreve my_configs.vim (carrega depois)" \
      || fail "IT-093g: precedência pasta-sobre-arquivo errada — $_out"
  fi
fi

# ── IT-094: doc do exemplo e gitignore de subarquivo ─────────────────────────
echo ""
echo "── IT-094: doc do exemplo e ignore de subarquivo ───────────────────────"

# IT-094a: o guia "fica local vs. abre PR" continua no exemplo
if grep -qi "abre.*pr\|abra um pr\|abre um pr" "$REPO_ROOT/my_configs.vim.example" \
   && grep -qi "fica local" "$REPO_ROOT/my_configs.vim.example"; then
  pass "IT-094a: .example mantém o guia local-vs-PR"
else
  fail "IT-094a: guia local-vs-PR sumiu do .example"
fi

# IT-094b: o comando de ativação (cp do exemplo) está documentado
if grep -q "cp .*my_configs.vim.example .*my_configs.vim" "$REPO_ROOT/my_configs.vim.example"; then
  pass "IT-094b: .example documenta o comando de ativação (cp)"
else
  fail "IT-094b: comando de ativação ausente no .example"
fi

# IT-094c: um arquivo DENTRO de my_configs/ também é ignorado pelo git
if command -v git > /dev/null 2>&1; then
  if git -C "$REPO_ROOT" check-ignore -q "my_configs/qualquer.vim" 2>/dev/null; then
    pass "IT-094c: my_configs/<arquivo>.vim é ignorado pelo git"
  else
    fail "IT-094c: my_configs/<arquivo>.vim NÃO é ignorado pelo git"
  fi
else
  warn "IT-094c: git ausente — pulei a checagem de ignore de subarquivo"
fi

# IT-094d: os READMEs documentam a personalização local (descobribilidade)
# — o principal (inglês) com "Customizing", o pt-BR com "Personalizando"
if grep -qi "my_configs" "$REPO_ROOT/README.md" \
   && grep -qi "Customizing" "$REPO_ROOT/README.md" \
   && grep -qi "my_configs" "$REPO_ROOT/README.pt.md" \
   && grep -qi "Personalizando" "$REPO_ROOT/README.pt.md"; then
  pass "IT-094d: READMEs documentam a personalização local (my_configs)"
else
  fail "IT-094d: READMEs não documentam my_configs (Customizing/Personalizando)"
fi

# ── Resultado ─────────────────────────────────────────────────────────────────
echo ""
echo "────────────────────────────────────────────────────────────────────────"
echo "  PASS: $PASS  |  WARN: $WARN  |  FAIL: $FAIL"
echo "────────────────────────────────────────────────────────────────────────"

[ "$FAIL" -eq 0 ]
