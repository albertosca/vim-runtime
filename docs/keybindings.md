# Cheatsheet de Atalhos

`mapleader` = vírgula (`,`)

Este arquivo cobre **Vim e Neovim** — a maior parte dos atalhos é idêntica nos dois (mesmo `configs.vim` compartilhado). Onde os dois divergem (LSP, completion, plugins visuais), tem uma nota clara **[Vim]** / **[Neovim]** ao lado. Seções 16+ são exclusivas do Neovim (não existem no Vim).

> **Tela de boas-vindas:** abrir `vim`/`nvim` sem argumento (buffer vazio, sem sessão restaurada) mostra uma mini-versão deste cheatsheet direto na tela — conteúdo adaptado por editor (`s:StartScreenLines()` em `configs.vim`, branch `has('nvim')`). Não aparece se abrir com arquivo, sessão restaurada, ou dentro da suite de testes.

---

## 1. Arquivos, Buffers e Busca (fzf)

| Atalho | Ação | Plugin |
| :--- | :--- | :--- |
| `Ctrl+f` | Buscar arquivos do projeto (popup) | fzf |
| `Ctrl+b` | Buscar buffers abertos | fzf |
| `,gf` | Buscar apenas arquivos rastreados pelo git | fzf |
| `,rg` | Busca por conteúdo com ripgrep | fzf |
| `,bl` | Buscar linhas no buffer atual | fzf |
| `,ht` | Historico de arquivos abertos | fzf |
| `,nn` | Abrir/Fechar árvore de arquivos | NERDTree **[Vim]** / neo-tree **[Neovim]** |
| `,nf` | Localizar arquivo atual na árvore | NERDTree **[Vim]** / neo-tree **[Neovim]** |
| `,nb` | Abrir NERDTree a partir de um bookmark | NERDTree **[Vim apenas]** |
| `,cs` | Copiar caminho **relativo ao diretório aberto** (com vim-rooter, é relativo à raiz do projeto) | Custom |
| `,cl` | Copiar **caminho absoluto completo** | Custom |

> **Dentro do fzf:** `Tab` seleciona multiplos, `Ctrl+/` alterna preview, `Enter` abre, `Ctrl+t` abre em nova aba, `Ctrl+x` split horizontal, `Ctrl+v` split vertical.

---

## 2. Janelas, Abas e Buffers

**Splits e abas:**

| Atalho | Ação |
| :--- | :--- |
| `Ctrl+h/j/k/l` | Navegar entre splits |
| `Ctrl+Shift+h/l` | Mover aba para esquerda ou direita |
| `gr` | Aba anterior (`:tabprev`) |
| `,tn` | Nova aba (se vim-test não interceptar — ver seção 8) |
| `,tc` | Fechar aba |
| `,to` | Fechar todas as outras abas (`:tabonly`) |
| `,te` | Abrir aba no diretório do arquivo atual |
| `,tl` | Toggle entre esta aba e a última acessada |
| `,tm <num>` | Mover aba para posição `<num>` (interativo) |
| `,t,` | Ir para próxima aba (`<leader>t<leader>` → `:tabnext`) |

**Buffers:**

| Atalho | Ação |
| :--- | :--- |
| `,l` | Próximo buffer |
| `,h` | Buffer anterior |
| `,bd` | Fechar buffer atual (e a aba se ficar vazia) |
| `,ba` | Fechar TODOS os buffers (`:bufdo bd`) |
| `[b` / `]b` | Buffer anterior/próximo (vim-unimpaired — ver seção 6) |

---

## 3. Edição e Produtividade

**Edição e busca:**

| Atalho | Ação | Plugin |
| :--- | :--- | :--- |
| `Alt+j/k` | Mover linha para baixo/cima (`Cmd+j/k` no GVim macOS) | Nativo |
| `,w` | Salvar (`:w!`) | Nativo |
| `*` / `#` | Buscar palavra selecionada em visual mode | Nativo |
| `F3` **ou** `,hs` | Ligar/desligar realce de busca (`,hs` existe pra teclado sem teclas F) | Nativo |
| `,<Enter>` | Desligar realce da busca atual (`:noh`) | Nativo |
| `(visual) ,r` | Buscar-e-substituir o texto selecionado | Custom |
| `,pp` | Ligar/desligar modo paste | Nativo |
| `y` / `p` / `P` | Yank / paste (histórico de yank cicla com `,yn`/`,yp` — ver seção 22) **[Neovim: yanky.nvim]** | Nativo **[Vim]** / yanky.nvim **[Neovim]** |
| `Ctrl+n` | Múltiplos cursores (próxima ocorrência — ver seção 15) | vim-visual-multi |
| `,u` | Abrir árvore visual de undo | undotree |
| `Ctrl+p` | Ligar/desligar auto-pairs | auto-pairs |
| `,cd` | `cd` para o diretório do arquivo atual (e mostra `pwd`) | Nativo |
| `,m` | Remover caracteres `^M` (line endings Windows) | Nativo |

**Scratch buffers (rascunho global):**

| Atalho | Ação |
| :--- | :--- |
| `,q` | Abrir scratch livre em `~/buffer` |
| `,x` | Abrir scratch Markdown em `~/buffer.md` |

**Corretor ortográfico:**

| Atalho | Ação |
| :--- | :--- |
| `,ss` | Ligar/desligar corretor |
| `,sn` | Próximo erro (`]s`) |
| `,sp` | Erro anterior (`[s`) |
| `,sa` | Adicionar palavra ao dicionário (`zg`) |
| `,s?` | Sugerir correções para a palavra sob o cursor (`z=`) |

**Linha de comando (`:` e `/`) — atalhos estilo Emacs/readline:**

| Atalho | Ação |
| :--- | :--- |
| `Ctrl+A` | Ir para o início da linha |
| `Ctrl+E` | Ir para o fim da linha |
| `Ctrl+K` | Apagar do cursor até o fim da linha |
| `Ctrl+P` / `Ctrl+N` | Comando anterior / próximo no histórico |

> **Smart auto-pairs:** `(`, `[`, `{`, `"`, `'`, `` ` `` não fecham automaticamente quando há texto colado à **direita** do cursor.

---

## 4. Surround — Envolver texto

Mesmos atalhos nos dois editores (`vim-surround` no Vim, `nvim-surround` no Neovim — comportamento idêntico por padrão).

**Modo normal** (`ysiw` = word, `yss` = linha inteira, `ys2j` = 2 linhas):

| Atalho | Resultado |
| :--- | :--- |
| `ysiw"` | `"palavra"` |
| `ysiw(` | `(palavra)` |
| `ysiw d` | `do` / `palavra` / `end` |
| `cs"'` | Troca `"` por `'` em volta do cursor |
| `ds"` | Remove as `"` em volta do cursor |

**Modo visual** (`v`/`V` seleciona, `S` + char envolve):

| `S` + | Resultado | Stack |
| :--- | :--- | :--- |
| `"` `'` `` ` `` | `"selecao"` `'selecao'` `` `selecao` `` | Qualquer |
| `(` ou `b` | `(selecao)` | Qualquer |
| `[` ou `r` | `[selecao]` | Qualquer |
| `{` ou `B` | `{selecao}` | Qualquer |
| `t` | `<tag>selecao</tag>` — pergunta a tag | HTML |
| `f` | `nome(selecao)` — pergunta o nome | Qualquer |
| `d` | `do` / `selecao` / `end` | Elixir, Ruby |
| `e` | `fn -> selecao end` (inline) | Elixir |
| `E` | `fn ->` / `selecao` / `end` | Elixir |
| `n` | `defmodule selecao do` / `end` | Elixir |
| `g` | `begin` / `selecao` / `end` | Ruby |
| `=` | `<%= selecao %>` | Rails ERB |
| `%` | `<% selecao %>` | Rails ERB |

**Atalho custom:**

| Sequência | Resultado | Uso típico |
| :--- | :--- | :--- |
| `Si` (visual) | `(_selecao)` com cursor após `)` | Captures Elixir (`&(_)`), lambdas com placeholder |

---

## 5. LSP e Completion — **[Vim: CoC.nvim]**

> No Neovim, o LSP é nativo — ver seção 16. **Não rode CoC e LSP nativo juntos**; o Vim continua 100% CoC.

| Atalho | Ação |
| :--- | :--- |
| `Tab` / `Shift+Tab` | Próximo/anterior item do completion |
| `Enter` | Confirmar completion |
| `Ctrl+Space` | Triggerar completion manualmente |
| `Ctrl+j` | Expandir/pular snippet |
| `K` | Documentação (hover popup) |
| `Ctrl+]` / `Cmd+]` | Goto Definition |
| `Ctrl+t` / `Cmd+[` | Voltar da definição |
| `gd` | Goto Definition (alternativo) |
| `gy` | Goto Type Definition |
| `gi` | Goto Implementation |
| `,gr` | Listar todas as referências |
| `,rn` | Renomear símbolo em todo o projeto |
| `,f` | Formatar seleção ou arquivo |
| `,a` | Code Actions no cursor (normal) ou seleção (visual) |
| `[g` / `]g` | Diagnóstico anterior / próximo |
| `Space+a` | Lista de todos os diagnósticos |
| `Space+o` | Outline do documento |
| `Space+s` | Buscar símbolos no workspace |
| `Space+e` | Gerenciar extensões CoC |
| `Space+c` | Listar comandos CoC |
| `Space+j/k` | Próximo/anterior na lista CoC ativa |
| `Space+p` | Retomar última lista CoC |
| `:Format` | Formatar buffer inteiro |
| `:OR` | Organizar imports |

> **Scroll de hover/diagnostic float:** com um popup do CoC aberto (hover via `K`, signature, diagnostic), use `Ctrl+f` / `Ctrl+b` em **insert** ou **visual** mode para rolar o float. Em **normal** mode esses atalhos pertencem ao fzf; fora de float aberto, `Ctrl+f` em insert vira `<Right>` e `Ctrl+b` vira `<Left>`.

---

## 6. Navegação de Diagnósticos e Quickfix (vim-unimpaired)

| Atalho | Ação |
| :--- | :--- |
| `[g` / `]g` | Diagnóstico CoC anterior/próximo **[Vim]** |
| `[q` / `]q` | Quickfix anterior/próximo |
| `[l` / `]l` | Location list anterior/próximo |
| `[b` / `]b` | Buffer anterior/próximo |
| `[n` / `]n` | Conflito de merge anterior/próximo |

---

## 7. Git

| Atalho | Ação | Plugin |
| :--- | :--- | :--- |
| `,gv` | Git log do projeto (navegável) | gv.vim |
| `,gV` | Git log do arquivo atual | gv.vim |
| `,gm` | Popup com commit e autor da linha atual | Custom |
| `,d` | Ligar/desligar diff no gutter (agora avisa ON/OFF) | vim-gitgutter **[Vim]** / gitsigns.nvim **[Neovim]** |
| `:Git` | Interface completa do git | vim-fugitive |
| `:Git blame` | Blame do arquivo | vim-fugitive |
| `,gd` | Abrir diffview (tab dedicada, arquivo-por-arquivo) **[Neovim]** | diffview.nvim |
| `,gc` | Fechar diffview **[Neovim]** | diffview.nvim |

> **Dentro do `:GV`:** `Enter` abre o commit, `o` abre em split, `q` fecha.

---

## 8. Testes (vim-test + Vimux)

| Atalho | Ação |
| :--- | :--- |
| `,tn` | Rodar teste **sob o cursor** |
| `,tf` | Rodar todos os testes do **arquivo** |
| `,ts` | Rodar a **suite inteira** |
| `,tl` | Repetir **último** teste |
| `,tv` | Ir para o último arquivo de teste |

**Suporte automático por linguagem:** Elixir (`mix test`), Ruby (`bundle exec rspec`), JS (Jest/Mocha), Python (pytest). Estratégia: Vimux (tmux). Mesmo nos dois editores.

---

## 9. Stacks Específicas

| Atalho | Ação | Stack |
| :--- | :--- | :--- |
| `:A` | Alternar código / teste | Elixir, Ruby/Rails |
| `,mf` | Mix Format (manual) | Elixir |
| `,md` | Mix Format Diff (preview) | Elixir |
| `,lc` | `mix credo --strict` no tmux | Elixir |
| `,ie` | Abrir IEx REPL no tmux | Elixir |
| `:Emodel` / `:Econtroller` | Navegar para model/controller | Rails |

**Auto-format ao salvar:** `.ex`, `.exs`, `.heex` (CoC + mix format **[Vim]**; mix format sozinho **[Neovim]**, sem CoC)

---

## 10. Banco de Dados (vim-dadbod)

| Atalho / Comando | Ação |
| :--- | :--- |
| `,db` | Abrir/fechar DB UI explorer |
| `,dba` | Adicionar nova conexão |
| `,dbf` | Encontrar buffer de query atual no explorer |
| `,dbr` | Renomear buffer de query atual |
| `:DB [url] [query]` | Executar SQL em split |

**Formato das URLs:** `postgresql://user:pass@localhost:5432/mydb` ou `mysql://user:pass@localhost:3306/mydb`

---

## 11. Sessões e Histórico

| Atalho | Ação |
| :--- | :--- |
| `,os` | Inicia/para tracking da sessão (`Session.vim` no CWD) |
| `vim`/`nvim` (sem args) | Restaura sessão automaticamente se `Session.vim` existir |
| `,u` | Abre árvore visual de undo (histórico persistente — **diretórios separados** entre Vim e Neovim, formatos incompatíveis) |

---

## 12. Terminal e Tmux (Vimux)

| Atalho | Ação |
| :--- | :--- |
| `,vp` | Prompt para rodar comando no painel tmux |
| `,vl` | Repetir último comando |
| `,vq` | Fechar painel tmux |
| `,vx` | Enviar `Ctrl+C` ao painel tmux |

---

## 13. Foco, Markdown e Misc

| Atalho | Ação |
| :--- | :--- |
| `,z` | Modo zen (Goyo — remove distrações visuais) |
| `,e` | Editar configs.vim |
| `,mdp` | Preview do Markdown (markdown-preview-enhanced) **[Vim]** |
| `,mdt` | Inserir tabela Markdown **[Vim]** |
| `,mdl` | Listar comandos Markdown **[Vim]** |
| `,mg` | Preview estilo terminal via `glow` — `:vert term` sem pager **[Vim]** / janela flutuante `:Glow`, cor forçada, sem pager **[Neovim]** |
| `,mr` | Liga/desliga a renderização inline de markdown (tabelas, headers, checkboxes) **[Neovim]** |
| `,Mm` | Liga/desliga table-mode (realinha colunas ao digitar `\|`) — mesmo nos dois editores |
| `,Mr` | Realinha uma tabela existente manualmente — **só existe depois de `,Mm` ligar** (mapping buffer-local, criado dinamicamente pelo próprio plugin) |

---

## 14. IA e Assistentes

### Claude Code (vim-claude-code) — **[Vim apenas]**

**Terminal:**

| Atalho | Ação |
| :--- | :--- |
| `Ctrl+\` | Toggle terminal Claude Code (normal e terminal mode) |
| `,cC` | Continuar sessão anterior (`--continue`) |
| `,cV` | Abrir em modo verbose |
| `Ctrl+W z` | Maximizar/restaurar janela do terminal Claude |

**Edição** — funcionam em normal mode (arquivo inteiro) e visual mode (seleção):

| Atalho | Ação |
| :--- | :--- |
| `,ce` | Explicar código / seleção |
| `,cf` | Corrigir código / seleção |
| `,cr` | Refatorar código / seleção |
| `,ct` | Gerar testes para o código / seleção |
| `,cd` | Gerar documentação |
| `,cn` | Renomear símbolo |
| `,co` | Otimizar código / seleção |

**Projeto** — normal mode:

| Atalho | Ação |
| :--- | :--- |
| `,cG` | Gerar mensagem de commit |
| `,cR` | Code review do arquivo atual |
| `,cp` | Criar Pull Request |
| `,cP` | Gerar plano de implementação |
| `,ca` | Analisar código / arquitetura |
| `,cD` | Debugging assistido |
| `,cA` | Aplicar diff sugerido pelo Claude |

**Chat e meta:**

| Atalho | Ação |
| :--- | :--- |
| `,cc` | Abrir chat livre com Claude |
| `,cx` | Enviar contexto do buffer ao Claude |
| `,cm` | Selecionar modelo Claude |

> **Comando principal:** `:Claude <subcomando>` — todos os atalhos acima são wrappers desse comando. Use `:Claude <Tab>` para completar.
>
> **No Neovim** este plugin é incompatível (checa `has('terminal')`, que o Neovim não implementa da mesma forma) e fica desligado — não há equivalente hoje. Use o `claude` CLI direto numa pane tmux ao lado.

### Copilot Chat

| Atalho / Comando | Ação | Onde |
| :--- | :--- | :--- |
| `,pc` | Abrir chat Copilot | Ambos (plugin diferente por trás) |
| `(visual) ,cq` | Perguntar ao Copilot sobre a seleção | Ambos |
| `:CopilotChatToggle` | Toggle do painel de chat | **[Vim]** copilot-chat.vim |
| `:CopilotChatModels` | Selecionar modelo | Ambos |
| `:CopilotChatReset` | Limpar conversa atual | Ambos |
| `:CopilotChatSave [nome]` | Salvar conversa | Ambos |
| `:CopilotChatLoad [nome]` | Carregar conversa salva | Ambos |

> **No Neovim** é o `CopilotChat.nvim` (Lua) por trás do `,pc` — precisa de **`:Copilot auth`** uma vez (login interativo, abre browser) antes de funcionar.

---

## 15. Visual Block

### Nativo (`Ctrl+V`)

| Atalho | Ação |
| :--- | :--- |
| `Ctrl+V` | Entrar em visual block mode |
| `I` | Inserir texto ANTES do bloco em todas as linhas (confirmar com `Esc`) |
| `A` | Adicionar texto DEPOIS do bloco em todas as linhas (confirmar com `Esc`) |
| `c` | Substituir o bloco em todas as linhas (confirmar com `Esc`) |
| `d` / `x` | Deletar o bloco |
| `r<char>` | Substituir todos os caracteres do bloco por `<char>` |
| `>` / `<` | Indentar / desindentar o bloco |
| `~` | Alternar maiúsculas/minúsculas |
| `u` / `U` | Converter para minúsculas / MAIÚSCULAS |
| `J` | Juntar as linhas do bloco |
| `o` | Mover cursor para o canto oposto |

---

### vim-visual-multi (`Ctrl+N`) — multi-cursor

O VM_leader deste plugin é `\` (barra invertida), independente do `<Leader>` do Vim. **Mesmo nos dois editores** — cuidado se instalar plugins novos no Neovim que também usem `Ctrl+N`/`Ctrl+P` em modo normal (já aconteceu com `yanky.nvim`, corrigido — ver seção 22).

**Entrada:**

| Atalho | Ação |
| :--- | :--- |
| `Ctrl+N` | Selecionar próxima ocorrência da palavra (normal) ou da seleção (visual) |
| `\A` | Selecionar TODAS as ocorrências de uma vez |
| `\\` | Adicionar cursor na posição atual |
| `Ctrl+Down` / `Ctrl+Up` | Adicionar cursores verticalmente (coluna) |
| `Shift+Down` / `Shift+Up` | Expandir seleção verticalmente |
| `Shift+Right` / `Shift+Left` | Expandir seleção horizontalmente |
| `(visual) \A` | Selecionar todas as ocorrências da seleção atual |
| `(visual) \c` | Criar cursores nos fins de linha da seleção |
| `(visual) \f` | Usar seleção como padrão de busca |

**Dentro da sessão VM:**

| Atalho | Ação |
| :--- | :--- |
| `Tab` | Alternar cursor mode ↔ extend mode |
| `n` / `N` | Próxima / anterior ocorrência |
| `]` / `[` | Ir para próximo / anterior cursor |
| `q` | Pular esta ocorrência e ir para a próxima |
| `Q` | Remover cursor/seleção atual |
| `Esc` | Sair do vim-visual-multi |

**Operações (dentro da sessão VM):**

| Atalho | Ação |
| :--- | :--- |
| `\a` | Alinhar cursores na mesma coluna |
| `\m` | Mesclar regiões sobrepostas |
| `\t` | Transpor seleções entre cursores |
| `\d` | Duplicar cada região |
| `\s` | Dividir regiões por padrão regex |
| `\N` / `\n` | Numerar sequencialmente (prefixo / sufixo) |
| `S` | vim-surround em todas as seleções |
| `M` | Toggle modo multi-linha |
| `\c` / `\C` | Case setting / menu de conversão |

> **Cursor mode** (padrão): comandos normais (`c`, `d`, `y`, `.`, etc.) operam em todos os cursores simultaneamente.
> **Extend mode** (`Tab`): comandos visuais (`>`, `<`, `S`, etc.) operam em todas as seleções.

---

# Neovim — exclusivo (não existe no Vim)

`~/.config/nvim/init.vim` reaproveita 100% do `configs.vim` acima (mesmo arquivo, mesmos atalhos das seções 1–15) e acrescenta o que vem a seguir. Arquitetura completa em [`neovim.md`](neovim.md).

## 16. LSP nativo (mason + nvim-lspconfig + blink.cmp)

Substitui o CoC só no Neovim (CoC fica desligado lá, evita duplicar diagnostics/completion).

| Atalho | Ação |
| :--- | :--- |
| `gd` | Goto Definition |
| `gi` | Goto Implementation |
| `K` | Hover (documentação) |
| `grr` | Referências (nativo do Neovim ≥0.11 — **não** `gr`, que é `:tabprev` de sempre) |
| `grn` | Rename (nativo do Neovim — equivalente a `,rn` abaixo) |
| `gra` | Code action (nativo do Neovim — equivalente a `,ca` abaixo) |
| `,rn` | Rename (nosso, mesma tecla do CoC) |
| `,ca` | Code action (nosso, mesma tecla do CoC) |
| `,fo` | Formatar buffer (via `conform.nvim` — prettier/etc) |

**Completion (`blink.cmp`):**

| Atalho | Ação |
| :--- | :--- |
| `Enter` | Aceita o item selecionado |
| `Tab` / `Shift+Tab` | Desce/sobe na lista (ou avança/volta snippet) |
| `↑` / `↓` | Navega na lista |
| `Ctrl+Space` | Abre completion manualmente |
| `Ctrl+y` | Aceita (alternativa) |
| `Ctrl+e` | Cancela |

**Inlay hints:** ligados automaticamente quando o servidor suporta (`gopls`, `ts_ls`/`typescript-tools`). **Python (`pyright`) não suporta** — é limitação do pyright open-source, só o Pylance (fechado, só-VSCode) tem isso.

**Servidores por linguagem:** ver tabela completa em [`neovim.md`](neovim.md#lsp-por-linguagem).

---

## 17. Treesitter

| Atalho | Ação |
| :--- | :--- |
| `af` / `if` | Text object de função (around/inner) — visual e operator-pending |
| `ac` / `ic` | Text object de classe (around/inner) |
| (automático) | Highlight, indent e fold (`foldmethod=expr`) via treesitter |
| (automático) | `nvim-treesitter-context`: fixa a linha da função/classe atual no topo ao rolar |

---

## 18. Telescope (pickers de LSP)

fzf.vim já cobre arquivos/grep/buffers/histórico (seção 1) — Telescope aqui é só pra LSP:

| Atalho | Ação |
| :--- | :--- |
| `,fs` | Document symbols |
| `,fw` | Workspace symbols |
| `,fr` | References |
| `,fd` | Diagnostics |

---

## 19. which-key.nvim

Automático — aperte `,` sozinho e espere ~1s: aparece um popup flutuante com os grupos de atalhos disponíveis. Sem comando pra lembrar.

---

## 20. DAP (debugger) — Elixir, Go, Python, Ruby, JS/TS

`nvim-dap` + `nvim-dap-ui`. Teclas F **e** equivalentes `,d*` (pra teclado sem teclas F):

| Tecla F | Equivalente `,d*` | Ação |
| :--- | :--- | :--- |
| `F5` | `,dc` | Continue |
| `F9` | `,dt` | Toggle breakpoint |
| `F10` | `,do` | Step over |
| `F11` | `,di` | Step into |
| `F12` | `,dO` (O maiúsculo) | Step out |

**Adapter por linguagem:**

| Linguagem | Adapter | Pré-requisito |
| :--- | :--- | :--- |
| Elixir | Embutido no `elixir-ls` (mason) | Nenhum extra |
| Go | `nvim-dap-go` | `go install github.com/go-delve/delve/cmd/dlv@latest` |
| Python | `nvim-dap-python` | `debugpy` (mason instala sozinho) |
| Ruby | `nvim-dap-ruby` | `rdbg` — gem `debug`, Ruby ≥3.1 no PATH do projeto (rbenv/asdf) |
| JS/TS | `nvim-dap-vscode-js` (mason: `js-debug-adapter`) | Nenhum extra |

---

## 21. Markdown — render-markdown.nvim + glow.nvim

Ver também seção 13 (`,mg`, `,mr`, `,Mm`/`,Mr` — compartilhados/anotados lá).

- **Renderização inline** (`,mr` liga/desliga): tabelas, headers e checkboxes viram visual direto no buffer via treesitter. Célula da tabela configurada como `raw` (não `padded`) — evita a coluna inteira esticar quando uma célula tem texto grande. Pra ler uma tabela grande direito, use `,mg` (glow) — só ele reflui/quebra texto de verdade.
- **`,mg` → `:Glow`**: janela flutuante a 90% da tela, buffer normal (rola com `j`/`k`/`gg`/`G`), `q`/`Esc` fecha, cor forçada (`CLICOLOR_FORCE=1`) mesmo sem pty real.

---

## 22. flash.nvim, harpoon2, trouble.nvim, diffview.nvim

| Atalho | Ação | Plugin |
| :--- | :--- | :--- |
| `s` (normal/visual/operator-pending) | Jump com labels — salta pra qualquer palavra visível na tela | flash.nvim |
| `,ha` | Marca o arquivo atual (harpoon) | harpoon2 |
| `,hh` | Abre o menu de arquivos marcados | harpoon2 |
| `,h1` .. `,h4` | Pula direto pro arquivo marcado 1–4 | harpoon2 |
| `,tt` | Lista de diagnostics num split | trouble.nvim |
| `,tq` | Lista de quickfix num split | trouble.nvim |
| `,gd` | Abre diffview (revisão de diff em tab dedicada) | diffview.nvim (também seção 7) |
| `,gc` | Fecha diffview | diffview.nvim |
| `,yn` / `,yp` | Cicla pro próximo/anterior item do histórico de yank (depois de `p`) | yanky.nvim |

> `S` (maiúsculo) do flash **não** foi mapeado de propósito — colidiria com o `S` visual do surround (seção 4), que é mais usado.
> `,ha`/`,hh` coexistem com `,h` = `:bprevious` (seção 2) — Vim espera o `timeoutlen` pra desambiguar, mesmo padrão já aceito em `,md`/`,mdp`.

---

## 23. vim-ai-autocomplete — autocomplete inline (Gemini/Claude) **[Neovim]**

| Atalho | Ação |
| :--- | :--- |
| (automático, ghost text) | Sugestão aparece sozinha ~600ms depois de parar de digitar (provider padrão: Gemini) |
| `Tab` | Aceita a sugestão — **só quando ela está visível**; sem sugestão, `Tab` funciona exatamente como antes (mapeamento original preservado, inclusive baseado em callback Lua tipo blink.cmp) |
| `<C-]>` | Descarta a sugestão visível **sem sair do insert mode** |
| `Esc` | Sai do insert mode normalmente (a sugestão é limpa junto, pelo `InsertLeavePre`) — o plugin **não** sequestra mais o `Esc` |
| `,pt` | Liga/desliga o auto-trigger (fica manual — sem custo de API não-intencional) |
| `,pr` | Cicla entre os modelos configurados em `g:vim_ai_autocomplete_models` (default: Gemini e Claude) — **só existe com 2+ modelos ativos** (API key presente) |
| `,pm` | Escolhe o modelo via `vim.ui.select` (funciona com Telescope automaticamente, se instalado) — alternativa ao `,pr`/comando pra quem tem 3+ modelos ativos |
| `:VimAiAutocompleteModel <nome>` | Seleciona um modelo diretamente pelo nome, sem precisar ciclar (autocomplete de argumento sugere os nomes ativos) |

> Port nativo em Lua do plugin próprio `vim-ai-autocomplete` (ver seção 26, Vim) — mesma arquitetura (prop_add/Vim 9 textprop do lado Vim; `nvim_buf_set_extmark` do lado Neovim), mesmas API keys (`~/.config/<provedor>/vim-ai-autocomplete.env`, lidas por `configs.vim` no Vim e por `nvim/init.vim` no Neovim — nunca export global em `~/.zsh_secrets`). Substituiu o `minuet-ai.nvim` (removido), que usava `,ap`/`,at` e uma key só em `~/.zsh_secrets`. `,pm` funciona nos dois lados: `popup_menu()` no Vim e, desde 2026-08-26, uma janela flutuante nativa no Neovim (`j`/`k` move, `<CR>` seleciona, `<Esc>`/`q` fecha) — antes era `vim.ui.select`, que sem plugin de UI vira um prompt numerado na cmdline.

---

## 24. Python — ruff, venv-selector

| Atalho | Ação |
| :--- | :--- |
| `,pv` | Selecionar virtualenv Python (reconfigura LSP e terminal integrado sem restart) |
| (automático) | `ruff` roda como LSP adicional ao `pyright` — lint/fix/organize-imports rápido, hover desligado (não duplica com o hover do pyright) |

---

## 25. O que foi cogitado e **não** instalado (e por quê)

| Plugin | Por que não |
| :--- | :--- |
| `vim.pack` (plugin manager nativo do Neovim 0.12) | `lazy.nvim` já funciona bem — trocar sem necessidade é churn |
| `toggleterm.nvim` | Redundante com `vimux`, que já resolve isso via tmux (seção 12) |
| `neotest` | Redundante com `vim-test`+`vimux` (seção 8) — mudaria o hábito, não complementaria |
| `avante.nvim` / `codecompanion.nvim` | Redundante — já tem Copilot Chat + Claude Code CLI |
| Next LS / Lexical (Elixir) | Projeto novo oficial "Expert" (fusão de Next LS + Lexical + ElixirLS) sem data de lançamento — só ficar de olho |
| `typescript-language-server` (`ts_ls`) | **Substituído** por `typescript-tools.nvim` (mais rápido, fala direto com o `tsserver`) — decisão tomada, não pendência |

---

## 26. vim-ai-autocomplete — autocomplete inline (Gemini/Claude) **[Vim]**

| Atalho | Ação |
| :--- | :--- |
| (automático, ghost text) | Sugestão aparece sozinha ~600ms depois de parar de digitar (provider padrão: Gemini) |
| `Tab` | Aceita a sugestão — **só quando ela está visível**; sem sugestão, `Tab` funciona exatamente como antes (CoC) |
| `<C-]>` | Descarta a sugestão visível **sem sair do insert mode** |
| `Esc` | Sai do insert mode normalmente (a sugestão é limpa junto, pelo `InsertLeavePre`) — o plugin **não** sequestra mais o `Esc` |
| `,pt` | Liga/desliga o auto-trigger (fica manual — sem custo de API não-intencional) |
| `,pr` | Cicla entre os modelos configurados em `g:vim_ai_autocomplete_models` (default: Gemini e Claude) — **só existe com 2+ modelos ativos** (API key presente) |
| `:VimAiAutocompleteModel <nome>` | Seleciona um modelo diretamente pelo nome, sem precisar ciclar (autocomplete de argumento sugere os nomes ativos) |

> Plugin próprio (`plugins/vim-ai-autocomplete/`), arquitetura inspirada na técnica pública do `github/copilot.vim` (prop_add/Vim 9 textprop) — nenhum código copiado (copilot.vim é "All Rights Reserved"). Mesma UX do port Neovim (seção 23): Gemini padrão, Claude via toggle, mesmas API keys (`~/.config/<provedor>/vim-ai-autocomplete.env`, lidas por `configs.vim` e setadas so no processo do Vim/Neovim — nao mais export global em `~/.zsh_secrets`). Claude sempre via `ANTHROPIC_API_KEY` estática — o CLI `ant` (OAuth) foi cogitado e removido: ele cobra do mesmo credito de API pago por token, sem dar acesso ao uso incluso da assinatura Claude Pro/Max (achado real, 2026-07-20).
>
> **N modelos configuráveis (2026-07-21):** por padrão o plugin usa só Gemini e Claude, mas `g:vim_ai_autocomplete_models` aceita uma lista de quantos modelos quiser, desde que sigam uma das duas famílias de API já suportadas (`gemini` — estilo Google Generative Language; `anthropic` — estilo Messages API). Ex: adicionar um segundo modelo Claude (Haiku, mais barato) é só uma entrada a mais na lista, sem editar código. Ver `docs/superpowers/specs/2026-07-21-vim-ai-autocomplete-multi-model-design.md` pro formato completo.
