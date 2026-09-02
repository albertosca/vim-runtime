-- Some servers attach to a buffer without implementing the method a keymap
-- asks for (tailwindcss-language-server attaches to markdown and has no
-- textDocument/definition), and vim.lsp.buf.* then prints
-- 'method "..." is not supported by any server activated for this buffer'.
-- Each LSP keymap goes through here: run the LSP action only when an attached
-- client supports the method; otherwise fall back to Vim's own command,
-- silently, so the key keeps doing something sensible in every buffer.
local M = {}

function M.supported(method, bufnr)
  return #vim.lsp.get_clients({ bufnr = bufnr or 0, method = method }) > 0
end

-- Returns a function usable as a keymap rhs.
function M.action(method, lsp_action, fallback)
  return function()
    if M.supported(method) then
      return lsp_action()
    end
    if fallback then
      return fallback()
    end
  end
end

return M
