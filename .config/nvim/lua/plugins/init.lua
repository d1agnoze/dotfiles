return {
  ---ESSENTIALS
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      return require "nvchad.configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
      -- change selection color
      vim.cmd [[highlight TelescopeSelection guifg=black guibg=#32CD32]]
    end,
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
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "vdac.tree-sitter",
  },
  { "tpope/vim-dispatch", lazy = false },
  { "nvim-lua/plenary.nvim", lazy = false },
  -----------------------------------------------------
  -- TOOLS
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
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      require "vdac.codepium"
    end,
  },
  -----------------------------------------------
  --- BETTER EXPERIENCE
  { "tpope/vim-surround", lazy = false },
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
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        mode = "background", -- You can change the mode to "foreground" to colorize foreground color codes
        RGB = true, -- Enable RGB color notation support
        RRGGBB = true, -- Enable RRGGBB color notation support
        names = false, -- Disable color name highlighting (e.g., "red", "blue", etc.)
        css = true, -- Disable CSS color notation support
      },
    },
  },
  -------------------------------
  -- DAP/DEBUG SECTION
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "williamboman/mason.nvim",
    },
    keys = { "<C-b>" },
    config = function()
      require("nvim-dap-virtual-text").setup()
      require("dap.ext.vscode").load_launchjs(nil, {})
      require("dap-go").setup()
      require "vdac.dap_ui"
      require "vdac.dap_keymap"
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" },
    config = function()
      local opt = require "vdac.mason-dap"
      require("mason-nvim-dap").setup(opt)
    end,
  },
  ------------------------------
}
