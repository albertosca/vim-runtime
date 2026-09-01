-- Copilot must never run (Alberto, 2026-07-18; reaffirmed 2026-09-01 after the
-- test suites kept spawning @github/copilot-language-server -- one keychain
-- prompt per run, machine-wide thrashing when denied). This spec runs under
-- test/nvim/minimal_init.lua, which puts the REAL lazy plugin directories on
-- the runtimepath -- exactly where the leak lived -- so it guards the path
-- the lazy-spec gate in nvim/lua/user/plugins.lua cannot reach.
describe("copilot stays off", function()
  it("no copilot plugin directory is on the runtimepath", function()
    local hits = vim.tbl_filter(function(p) return p:lower():find('copilot', 1, true) ~= nil end, vim.opt.rtp:get())
    assert.are.same({}, hits)
  end)

  it("neither :Copilot nor :CopilotChat exists", function()
    assert.are.equal(0, vim.fn.exists(':Copilot'))
    assert.are.equal(0, vim.fn.exists(':CopilotChat'))
  end)

  it("no copilot Lua module has been loaded", function()
    for name in pairs(package.loaded) do
      assert.is_nil(name:lower():find('^copilot'), 'loaded module: ' .. name)
    end
  end)

  it("the single switch is off", function()
    assert.is_not_true(vim.g.copilot_enabled)
  end)
end)
