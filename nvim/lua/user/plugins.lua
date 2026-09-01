-- Bootstrap lazy.nvim e spec da camada Lua (Fase 2+ da migração,
-- ver docs/neovim.md).
-- Plugins vimscript compartilhados com o Vim continuam via Pathogen (~/.vimrc);
-- isto aqui é só a parte exclusiva do Neovim.

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    { 'mason-org/mason.nvim', config = true },
    { 'mason-org/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'saghen/blink.cmp', version = '*',
      dependencies = { 'L3MON4D3/LuaSnip', 'rafamadriz/friendly-snippets' },
      opts = {
        snippets = { preset = 'luasnip' },
        keymap = {
          preset = 'default',
          ['<CR>'] = { 'select_and_accept', 'fallback' },
          ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
          ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        },
      } },
    { 'stevearc/conform.nvim' },
    { 'mfussenegger/nvim-lint' },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

    -- Fase 3: treesitter, telescope, which-key, dap
    { 'nvim-treesitter/nvim-treesitter', branch = 'main', build = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
    { 'nvim-treesitter/nvim-treesitter-context' },
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'folke/which-key.nvim' },
    { 'mfussenegger/nvim-dap' },
    { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' } },

    -- Fase 4: substituições visuais (nerdtree, gitgutter, lightline, devicons, surround)
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x',
      dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' } },
    { 'lewis6991/gitsigns.nvim' },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'kylechui/nvim-surround' },

    -- Fase 5: dap com adapters reais (Elixir usa o debugger embutido do
    -- elixir-ls, já instalado — sem plugin extra)
    { 'suketa/nvim-dap-ruby' },
    { 'mxsdev/nvim-dap-vscode-js', dependencies = { 'mfussenegger/nvim-dap' } },
    -- Gap achado depois: Go e Python nunca ganharam DAP na Fase 5.
    { 'leoluz/nvim-dap-go' },
    { 'mfussenegger/nvim-dap-python' },

    -- Pendências fechadas a pedido: yanky (substitui coc-yank) e
    -- CopilotChat.nvim (substitui copilot-chat.vim, desligado na Fase 1).
    -- CopilotChat.nvim precisa de `:Copilot auth` manual — não dá pra
    -- automatizar login interativo.
    { 'gbprod/yanky.nvim' },
    -- Copilot is OFF (Alberto, 2026-07-18) -- and "off" has to happen HERE, at
    -- the lazy spec, not only in user/copilot.lua: with the specs enabled,
    -- CopilotChat.nvim (no lazy trigger) loaded at every startup and pulled
    -- copilot.lua in as a dependency, and the plugin files spawned the
    -- @github/copilot-language-server through npx even though setup() was
    -- never called -- caught on 2026-09-01, when the headless test suite kept
    -- launching it. One switch, read by user/copilot.lua as well.
    { 'zbirenbaum/copilot.lua', cmd = 'Copilot', event = 'InsertEnter', enabled = vim.g.copilot_enabled == true },
    { 'CopilotC-Nvim/CopilotChat.nvim', branch = 'main', enabled = vim.g.copilot_enabled == true,
      dependencies = { 'zbirenbaum/copilot.lua', 'nvim-lua/plenary.nvim' } },

    -- Renderiza markdown (tabelas, headers, checkboxes) direto no buffer via
    -- treesitter. vim-table-mode (auto-alinhar ao editar) fica no Vim
    -- compartilhado (~/.vim_runtime/plugins/), é puro vimscript.
    { 'MeanderingProgrammer/render-markdown.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' } },

    -- Wrapper Neovim de verdade em cima do mesmo `glow` — janela flutuante
    -- larga (sem o split apertado) e sem o pager interativo (buffer normal,
    -- rola com j/k/gg/G). ,mg no Vim continua com o :term cru (configs.vim).
    { 'ellisonleao/glow.nvim' },

    -- QoL aprovados: flash (motions), harpoon2 (marks rápidos),
    -- trouble (diagnostics/quickfix), diffview (revisão de diff em tab própria).
    { 'folke/flash.nvim' },
    { 'ThePrimeagen/harpoon', branch = 'harpoon2', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'sindrets/diffview.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

    -- Gaps por linguagem: troca venv sem restart, e substitui ts_ls (mais
    -- rápido, fala direto com o protocolo nativo do tsserver).
    { 'linux-cultist/venv-selector.nvim',
      dependencies = { 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' } },
    { 'pmizio/typescript-tools.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' } },
  },
  -- lazy.nvim reseta &runtimepath por padrão (otimização de performance) —
  -- isso apaga tudo que o Pathogen já adicionou em ~/.vimrc (coc.nvim,
  -- nerdtree, fugitive, etc). Desligado porque convivemos com Pathogen.
  performance = { rtp = { reset = false } },
})
