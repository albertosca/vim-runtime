-- Shared config for `luacheck nvim/lua/` (run locally and in CI).
-- Mirrors plugins/vim-ai-autocomplete/.luacheckrc, which owns its own suite.
std = 'lua51'
globals = { 'vim' }
-- 631 = "line too long": comments follow a one-line-per-paragraph
-- convention, so line length is deliberately not enforced.
ignore = { '631' }
exclude_files = { 'plugins/' }
