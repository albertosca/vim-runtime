-- copilot.lua + CopilotChat.nvim substituem copilot-chat.vim/vim-claude-code
-- no Neovim (desligados na Fase 1 por incompatibilidade). Precisa de login:
-- rode `:Copilot auth` uma vez (abre browser + código de dispositivo) —
-- login interativo, não dá pra automatizar.

-- Off by default (Alberto, 2026-07-18) -- the copilot.vim sibling on the Vim
-- side threw on every startup (E723/E10 in the client start, real finding
-- during manual testing). Symmetry between the two sides: off here as well.
--
-- The switch is vim.g.copilot_enabled, set in init.vim BEFORE lazy loads the
-- specs: user/plugins.lua reads it to keep copilot.lua and CopilotChat.nvim
-- from loading at all. Skipping setup() here was not enough -- the plugins
-- still loaded at startup and spawned @github/copilot-language-server
-- (2026-09-01). To re-enable: set vim.g.copilot_enabled = true in init.vim,
-- restart, then run `:Copilot auth` once.
local copilot_enabled = vim.g.copilot_enabled == true

if copilot_enabled then
  require('copilot').setup({
    suggestion = { enabled = false }, -- sugestão inline fica pro CoC (Vim) / gosto pessoal
    panel = { enabled = false },
  })

  require('CopilotChat').setup({})

  -- Mesmos atalhos que copilot-chat.vim usava no Vim (configs.vim:561/562).
  vim.keymap.set('n', '<leader>pc', ':CopilotChatOpen<CR>', { silent = true })
  vim.keymap.set('x', '<leader>cq', ':CopilotChat<Space>', {})
end
