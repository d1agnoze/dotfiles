local M = {
  deps = {
    {
      "ravitemer/mcphub.nvim",
      event = "BufRead",
      build = "npm install -g mcp-hub@latest",
      config = function()
        require("mcphub").setup {}
      end,
    },
  },
  keys = {
    { "<leader>cp", "<cmd>CodeCompanionChat Toggle<CR>" },
    { "<leader>cr", "<cmd>CodeCompanionActions<CR>", mode = { "n", "v" }, desc = "CodeCompanion: Actions" },
  },
  config = function()
    require("codecompanion").setup {
      display = {
        chat = {
          auto_scroll = true,
          show_setting = true,
        },
        diff = {
          enabled = true,
          word_highlights = {
            additions = true,
            deletions = true,
          },
        },
      },
      interactions = {
        chat = {
          adapter = "copilot_acp",
          keymaps = {
            send = {
              modes = { n = "<C-s>", i = "<C-s>" },
              opts = {},
            },
            close = {
              modes = { n = "<Esc>", i = "<C-x>" },
              opts = {},
            },
          },
        },
      },
    }
  end,
}

return M
