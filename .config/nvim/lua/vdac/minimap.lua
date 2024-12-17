local M = {}
M.keys = {
  {
    "<leader>mm",
    function()
      vim.cmd "lua MiniMap.toggle()"
    end,
    desc = "Open MiniMap",
  },
}
M.config = function()
  local map = require "mini.map"
  map.setup {
    integrations = {
      map.gen_integration.builtin_search(),
      map.gen_integration.diff(),
      map.gen_integration.diagnostic(),
    },
    symbols = {
      encode = map.gen_encode_symbols.dot('3x2'),
    },
    window = {
      show_integration_count = true,
      width = 7,
      winblend = 100,
      zindex = 1,
    },
  }
end
return M
