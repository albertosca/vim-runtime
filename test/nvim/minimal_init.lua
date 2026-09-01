-- Init minimo pra rodar specs plenary sobre nvim/lua/user/*.lua sem subir o
-- init.vim inteiro (LSP/DAP/lazy.nvim reais, lento e desnecessario aqui).
-- So adiciona ao runtimepath: (1) todo plugin instalado via lazy.nvim, pra
-- que require('mason')/require('dap')/etc resolvam igual ao runtime real;
-- (2) nvim/, pra que require('user.<modulo>') resolva pro nosso codigo.
--
-- mapleader precisa ser setado ANTES de qualquer require('user.X') que
-- registre keymap com <leader> -- senao o Neovim usa o default ('\'), nao
-- o ',' real do configs.vim, e specs que checam o lhs literal do keymap
-- (ex: ',rn') vao falhar comparando contra o lhs errado.
vim.g.mapleader = ','

-- Copilot stays OUT of the runtimepath unless vim.g.copilot_enabled: merely
-- having copilot.lua / CopilotChat.nvim on the rtp runs their plugin/ files,
-- which spawn @github/copilot-language-server through npx -- one keychain
-- prompt per test run, and denying it thrashed the whole machine
-- (2026-09-01). Same single switch as nvim/lua/user/plugins.lua.
for _, path in ipairs(vim.fn.glob(vim.fn.expand("~/.local/share/nvim/lazy") .. "/*", true, true)) do
  if vim.g.copilot_enabled == true or not path:lower():find("copilot", 1, true) then
    vim.opt.rtp:append(path)
  end
end

local this_file = debug.getinfo(1, "S").source:sub(2)
local test_nvim_dir = vim.fn.fnamemodify(this_file, ":h")
local repo_root = vim.fn.fnamemodify(test_nvim_dir, ":h:h")
vim.opt.rtp:append(repo_root .. "/nvim")
