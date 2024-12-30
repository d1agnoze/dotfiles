return {
  ---INFO: ESSENTIALS
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
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
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-dap.nvim",
    },
    cmd = "Telescope",
    opts = {
      extensions_list = { "dap" },
      extensions = {
        dap = {
          prompt_title = "[ Debugger ]",
        },
      },
    },
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
      table.insert(M.sources, { name = "codeium" })
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
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {
      select = {
        telescope = {
          initial_mode = "normal",
        },
      },
    },
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
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function()
      require("copilot_cmp").setup()
    end,
    dependencies = {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = function()
        require("copilot").setup {
          suggestion = { enabled = false },
          panel = { enabled = false },
        }
      end,
    },
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
    config = function()
      require("lspsaga").setup { lightbulb = { virtual_text = false } }
    end,
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
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = { aggressive_mode = false },
  },
  {
    "nat-418/boole.nvim",
    event = "BufRead",
    config = function()
      require("boole").setup {
        mappings = {
          increment = "<C-a>",
          decrement = "<C-x>",
        },
        -- User defined loops
        additions = {
          { "Foo", "Bar" },
          { "tic", "tac", "toe" },
        },
        allow_caps_additions = {
          { "enable", "disable" },
          -- enable → disable
          -- Enable → Disable
          -- ENABLE → DISABLE
        },
      }
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    config = function()
      require("render-markdown").setup {
        overrides = {
          buftype = {
            nofile = {
              code = { left_pad = 0, right_pad = 0, style = "language" },
              sign = { enabled = false },
            },
          },
        },
      }
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
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
    config = function()
      require("nvim-dap-virtual-text").setup()
      -- require("dap.ext.vscode").load_launchjs(nil, {})
      require("dap-go").setup()
      require "vdac.dap_ui"
      require "vdac.dap_keymap"
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    event = { "LspAttach" },
    keys = {
      {
        "<leader>rn",
        function()
          return ":IncRename " .. vim.fn.expand "<cword>"
        end,
        "n",
        expr = true,
        remap = true,
        desc = "lsp rename",
        silent = true,
      },
    },
    dependencies = { "stevearc/dressing.nvim" },
    opts = { input_buffer_type = "dressing" },
  },
  {
    "Pocco81/HighStr.nvim",
    event = { "BufEnter" },
    opts = require("vdac.highstr").opts,
    config = require("vdac.highstr").config(),
  },
  {
    "gorbit99/codewindow.nvim",
    event = { "BufEnter" },
    config = require("vdac.minimap").config,
  },
}
