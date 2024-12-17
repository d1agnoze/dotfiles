local M = {}

M.opts = {
  modes = {
    symbols = {
      filter = {
        ["not"] = { ft = "go", kind = "Field" },
      },
    },
  },
}

M.cmd = "Trouble"

M.keys = {
  {
    "<leader>lid",
    "<cmd>Trouble diagnostics toggle<cr>",
    desc = "Diagnostics (Trouble)",
  },
  {
    "<leader>lis",
    "<cmd>Trouble symbols toggle<cr>",
    desc = "Symbols (Trouble)",
  },
  {
    "<leader>lit",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    desc = "LSP Definitions / references / ... (Trouble)",
  },
  {
    "<leader>liq",
    "<cmd>Trouble qflist toggle<cr>",
    desc = "Quickfix List (Trouble)",
  },
}

return M
