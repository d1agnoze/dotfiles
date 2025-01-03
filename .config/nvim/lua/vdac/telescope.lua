local action = require "telescope.actions"
local M = {}
M.deps = {
  "nvim-treesitter/nvim-treesitter",
  "nvim-telescope/telescope-dap.nvim",
  "nvim-telescope/telescope-frecency.nvim",
}
M.opts = {
  pickers = {
    buffers = {
      initial_mode = "normal",
      mappings = {
        i = {
          ["<esc>"] = action.close,
        },
        n = {
          ["dd"] = action.delete_buffer + action.move_to_top,
        },
      },
    },
    registers = {
      initial_mode = "normal",
      previewer = true,
    },
  },
  extensions_list = { "dap", "frecency" },
  extensions = {
    frecency = { show_unindexed = true },
    dap = { prompt_title = "[ Debugger ]" },
  },
}

return M
