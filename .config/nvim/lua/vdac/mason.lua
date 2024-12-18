local M = {}

local init = require "vdac.bootstrap"

---@type string[]
local installs = {}

for _, lsp in ipairs(init.lsp) do
  table.insert(installs, lsp.name)
end

for _, linter in ipairs(init.linters) do
  table.insert(installs, linter)
end

for _, dap in ipairs(init.daps) do
  table.insert(installs, dap)
end

for _, fmt in ipairs(init.fmts) do
  table.insert(installs, fmt)
end

M.ensure_installed = installs

return M
