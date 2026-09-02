# Checagens manuais — vim-ai-autocomplete e config (2026-09-02)

O que **não** dá pra provar headless e precisa de olho humano. Faça no Vim e depois no Neovim. Cada item diz como provocar e o que esperar.

**Antes de tudo:** reabra o editor (config e plugin mudaram hoje) e confira que a feature de alternativas está ligada: `:echo g:vim_ai_autocomplete_alternatives` → `3`.

## 1. Ciclar alternativas (`Option+.` / `Option+,`)

- **Provocar:** deixe uma sugestão aparecer (qualquer modelo), então `Option+.`.
- **Esperar:** o `…` aparece no fim da linha, ~1–4 s depois a sugestão é substituída por outra; `Option+,` volta pra anterior; `Tab` aceita a que estiver na tela. Alternativas idênticas colapsam — se o modelo repetir, uma mensagem curta avisa e nada muda.
- **Se falhar:** `Option+.` sair do insert = a tecla chegou como `Esc` + `.`. No terminal, `cat -v` + `Option+.` tem que mostrar `^[.`; se mostrar `≥`, o iTerm dessa aba ainda está com Option "Normal" (vale só pra abas novas).

## 2. Marcador de requisição em voo (`…`)

- **Provocar:** modelo `claude-haiku` ou `claude-sonnet` (os mais lentos). Digite e pare.
- **Esperar:** ~400 ms depois da pausa, `…` no fim da linha; some no instante em que a sugestão aparece (ou quando a requisição falha/fica velha). No Gemini quase nunca aparece — a resposta chega antes do atraso. Isso é o desenho.

## 3. Menu de completion vence o ghost text

- **Provocar (Vim + CoC):** num arquivo com uma palavra longa já escrita (ex.: `helper`), noutra linha digite as três primeiras letras (`hel`) e pare. O popup do CoC abre com `helper` (fonte de buffer). Espere 3 s **com o popup aberto**.
- **Esperar:** nada de ghost text nem `…` enquanto o popup estiver aberto. Feche o popup (`Ctrl-e` ou continue digitando até ele sumir) e pare de novo: a sugestão volta.
- **Neovim:** mesmo roteiro; o menu é o do blink.cmp.

## 4. Corte de contexto no escopo (o seu bug original)

- **Provocar:** abra `~/Programming/autocomplete-test.py`, modelo `claude-haiku`. Cursor logo depois de `class Stack:` (última linha), entre em insert e pare.
- **Esperar:** a sugestão é o corpo de `Stack` (`__init__`, `push`, `pop`…). **Errado** seria ela completar a `fibonacci` ou o `def add()` lá de cima — era o que acontecia quando o arquivo inteiro ia como contexto.
- **Bônus:** cursor dentro de uma função que deveria chamar outra já definida no arquivo → a sugestão usa o nome existente em vez de reinventar (`RELATED DEFINITIONS`).

## 5. `gd` em markdown (Neovim)

- **Provocar:** um `.md` dentro de um projeto com `package.json` (o tailwind anexa aí). `:verbose nmap gd` → deve apontar pra `lsp_fallback.lua`. Cursor numa palavra que aparece antes no arquivo, `gd`.
- **Esperar:** pula pra primeira ocorrência, sem a mensagem "method textDocument/definition is not supported". `K` e `gi` têm o mesmo guard.

## 6. `Esc` no insert mode

- `ttimeoutlen` passou de 500 ms (herdado) pra 50 ms. `Esc` deve responder mais rápido; nenhuma tecla com Alt/setas pode ter quebrado.

## 7. Nada de Copilot

- Em nenhum momento o macOS pode pedir keychain. `ps ax | grep -i copilot` → vazio, sempre.
