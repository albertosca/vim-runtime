local fallback = require('user.lsp_fallback')

describe("user.lsp_fallback", function()
  local buf

  before_each(function()
    buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_current_buf(buf)
  end)

  after_each(function()
    vim.api.nvim_buf_delete(buf, { force = true })
  end)

  it("with no client supporting the method, gd falls back to Vim's own gd (and jumps)", function()
    -- the reported case: markdown with only tailwindcss attached printed
    -- 'method "textDocument/definition" is not supported...' on gd
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { 'foo = 1', 'bar = 2', 'print(foo)' })
    vim.api.nvim_win_set_cursor(0, { 3, 6 })
    assert.is_false(fallback.supported('textDocument/definition'))
    local lsp_called = false
    local handler = fallback.action('textDocument/definition', function() lsp_called = true end,
      function() vim.cmd('normal! gd') end)
    handler()
    assert.is_false(lsp_called)
    assert.are.equal(1, vim.api.nvim_win_get_cursor(0)[1], 'built-in gd jumped to the first "foo"')
  end)

  it("with no fallback given, an unsupported method is a silent no-op", function()
    local lsp_called = false
    fallback.action('textDocument/implementation', function() lsp_called = true end)()
    assert.is_false(lsp_called)
  end)

  it("supported() reflects attached clients (none here)", function()
    assert.is_false(fallback.supported('textDocument/hover', buf))
  end)
end)
