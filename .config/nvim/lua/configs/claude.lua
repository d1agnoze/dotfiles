return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  -- `cmd` lets lazy.nvim create command stubs that load the plugin on first use, so `:ClaudeCode` and friends work on a fresh start.
  -- Without it, a keys-only spec defers loading until a <leader>cc* mapping is pressed and the commands would not exist yet.
  cmd = {
    "ClaudeCode",
    "ClaudeCodeFocus",
    "ClaudeCodeSelectModel",
    "ClaudeCodeAdd",
    "ClaudeCodeSend",
    "ClaudeCodeTreeAdd",
    "ClaudeCodeStatus",
    "ClaudeCodeStart",
    "ClaudeCodeStop",
    "ClaudeCodeOpen",
    "ClaudeCodeClose",
    "ClaudeCodeDiffAccept",
    "ClaudeCodeDiffDeny",
    "ClaudeCodeCloseAllDiffs",
  },
  keys = {
    { "<leader>ccc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    -- { "<leader>ccf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    -- { "<leader>ccr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    -- { "<leader>ccC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>ccm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ccb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>ccs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    -- stylua: ignore
    { "<leader>cca", "<cmd>ClaudeCodeTreeAdd<cr>", desc = "Add file", ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" }, },
    -- Diff management
    { "<leader>ccy", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ccn", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
}
