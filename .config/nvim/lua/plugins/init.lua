return {
  ---INFO: ESSENTIALS
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.null_ls"
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "nvchad.configs.gitsigns"
    end,
    config = function()
      require "vdac.gitsigns"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = require("vdac.telescope").deps,
    opts = require("vdac.telescope").opts,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      require("luasnip").setup()
      require "vdac.snip"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "nvchad.configs.cmp"
      -- table.insert(M.sources, { name = "codeium" })
      table.insert(M.sources, { name = "copilot" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = require "vdac.mason",
  },
  { "tpope/vim-dispatch", lazy = false },
  { "nvim-lua/plenary.nvim", lazy = false },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = require "vdac.tree-sitter",
  },
  -----------------------------------------------------
  --INFO: TOOLS
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("vdac.harpoon").config()
    end,
    keys = require("vdac.harpoon").keys,
  },
  {
    "Exafunction/codeium.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = {},
  },
  {
    "folke/trouble.nvim",
    opts = require("vdac.trouble").opts,
    cmd = require("vdac.trouble").cmd,
    keys = require("vdac.trouble").keys,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "BufRead",
    opts = { lightbulb = { virtual_text = false } },
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  -----------------------------------------------
  ---INFO: BETTER EXPERIENCE
  { "tpope/vim-surround", lazy = false },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = { "LspAttach" },
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config { virtual_text = true }
      vim.diagnostic.config { virtual_lines = { only_current_line = true } }
      vim.keymap.set("", "<Leader>tl", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufRead",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require "vdac.todo"
    end,
  },
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = { aggressive_mode = false },
  },
  {
    "nat-418/boole.nvim",
    event = "BufRead",
    opts = {
      mappings = { increment = "<C-a>", decrement = "<C-x>" },
      allow_caps_additions = { { "enable", "disable" } },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    opts = {
      overrides = {
        buftype = {
          nofile = {
            sign = { enabled = false },
            code = { left_pad = 0, right_pad = 0, style = "language" },
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "williamboman/mason.nvim",
      "mxsdev/nvim-dap-vscode-js",
    },
    config = function()
      require("nvim-dap-virtual-text").setup()
      require("dap-go").setup()
      require "configs.dap"
      require "vdac.dap_ui"
    end,
  },
  {
    "stevearc/aerial.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    event = { "LspAttach" },
    enabled = false,
    opts = {
      filter_kind = false,
    },
    keys = {
      { "<leader>lis", "<cmd>AerialToggle<CR>", "n", desc = "Toggle Aerial" },
    },
  },

  {
    "hedyhli/outline.nvim",
    event = { "LspAttach" },
    keys = {
      { "<leader>lis", "<cmd>Outline<CR>", "n", desc = "Toggle outline" },
    },
    opts = {
      outline_window = { width = 15 },
      symbol_folding = { auto_unfold = { hovered = false, only = false } },
      symbols = { filter = { "String", "Variable", exclude = true } },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side = "right",
      },
      renderer = { icons = { glyphs = { git = { untracked = "" } } } },
    },
  },
}
