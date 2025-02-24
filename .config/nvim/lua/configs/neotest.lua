local neotest = require "neotest"

neotest.setup {
  status = { virtual_text = true },
  output = { open_on_run = true },
  quickfix = {
    open = function()
      vim.cmd "copen"
    end,
  },
  adapters = {
    require "neotest-vitest",
  },
}
