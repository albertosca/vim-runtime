scriptencoding utf-8
" Esqueleto Neovim — Fase 1 da migração (ver docs/neovim.md)
" Reaproveita 100% da config do Vim; nenhuma duplicação.
" Demais exclusões (g:pathogen_disabled) e camada Lua entram nas fases seguintes.

" copilot-chat.vim usa sintaxe Vim9script (import autoload/def) que o Neovim
" não interpreta; vim-claude-code se autodetecta incompatível (checa
" has('terminal'), que no Neovim não existe da mesma forma). Ambos já estavam
" marcados pra virar CopilotChat.nvim (Lua) na Fase 4 — desligar agora só
" evita o erro de startup, sem mudar nada pro lado Vim.
" coc.nvim desligado no Neovim: LSP nativo (lsp.lua) assume esse papel —
" rodar os dois juntos duplica diagnostics/completion (ver plano, item de
" conflitos). No Vim, coc.nvim continua sendo o único LSP client.
" Fase 4: substituições visuais — analogs Lua assumem (neotree.lua,
" gitsigns.lua, lualine.lua, surround.lua). vim-devicons some junto pois só
" existia pra plugar no NERDTree; nvim-web-devicons cobre neo-tree/lualine.
" vim-which-key desligado no Neovim: o parser dele não entende o formato
" novo de `:map` do Neovim (keymaps Lua) e quebra o popup inteiro —
" which-key.nvim (user/whichkey.lua) cobre o mesmo papel nativamente.
let g:pathogen_disabled = ['copilot-chat.vim', 'vim-claude-code', 'coc.nvim',
      \ 'nerdtree', 'vim-nerdtree-syntax-highlight', 'vim-gitgutter',
      \ 'lightline.vim', 'vim-devicons', 'vim-surround', 'vim-commentary',
      \ 'vim-which-key']

source ~/.vimrc

" Config própria em lua/user/ (não lua/*.lua direto) para nunca colidir com o
" nome de módulo de um plugin — ex.: nvim-dap e gitsigns.nvim também têm um
" lua/dap.lua e lua/gitsigns.lua próprios; um arquivo nosso com o mesmo nome
" no topo de ~/.config/nvim/lua se auto-referenciaria em vez de carregar o
" plugin (loop em require()).

" Fase 2 — LSP nativo (lazy.nvim + mason + nvim-lspconfig + blink.cmp)
lua require('user.plugins')
lua require('user.lsp')

" Fase 3 — treesitter, telescope (pickers LSP), which-key.nvim, dap
lua require('user.treesitter')
lua require('user.telescope')
lua require('user.whichkey')
lua require('user.dap')

" Fase 4 — substituições visuais (neo-tree, gitsigns, lualine, surround)
lua require('user.neotree')
lua require('user.gitsigns')
lua require('user.lualine')
lua require('user.surround')

" Pendências fechadas: snippets, yank history, Copilot chat
lua require('user.snippets')
lua require('user.yanky')
lua require('user.copilot')
lua require('user.markdown')

" QoL aprovados: flash, harpoon2, trouble, diffview
lua require('user.flash')
lua require('user.harpoon')
lua require('user.trouble')
lua require('user.diffview')
lua require('user.glow')

" Gaps por linguagem: venv Python, typescript-tools (substitui ts_ls)
lua require('user.venv')
lua require('user.typescript')

" Autocomplete inline (ghost text) via Gemini/Claude -- porte nativo do
" plugins/vim-ai-autocomplete/ do lado Vim (ver
" docs/superpowers/specs/2026-07-21-vim-ai-autocomplete-nvim-port-design.md).
" Substitui minuet-ai.nvim (third-party, sem os bugfixes construidos aqui).
lua require('vim-ai-autocomplete').setup()
