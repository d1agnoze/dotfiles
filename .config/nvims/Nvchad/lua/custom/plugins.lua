local overrides = require("custom.configs.overrides")
local dap = require("custom.configs.dap-nvim")
---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{ "mfussenegger/nvim-dap" },
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			local dapr = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dapr.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dapr.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dapr.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"karb94/neoscroll.nvim",
		event = "BufRead",
		config = function()
			require("neoscroll").setup({
				mappings = { "<C-u>", "<C-d>" },
				hide_cursor = false,
				stop_eof = false,
				respect_scrolloff = false,
				cursor_scrolls_alone = false,
				easing_function = nil,
				pre_hook = nil,
				post_hook = function()
					vim.api.nvim_feedkeys("M", "n", {})
				end,
				performance_mode = false,
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		cmd = "Dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("mason-nvim-dap").setup(dap)
		end,
	},
	{ "tpope/vim-surround", lazy = false },
	{ "tpope/vim-dispatch", lazy = false },
	{ "nvim-lua/plenary.nvim", lazy = false },
	{
		"windwp/nvim-ts-autotag",
		event = "BufRead",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		config = function()
			require("luasnip").setup()
			require("custom.snip")
		end,
	},
	{
		"alvan/vim-closetag",
		event = "BufRead",
		enabled = false,
		setup = function()
			vim.g.closetag_emptyTags_caseSensitive = 1
			vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx,tsx"
			vim.g.closetag_filetypes = "html,xhtml,phtml"
			vim.g.closetag_xhtml_filetypes = "xhtml,jsx,tsx"
			vim.g.closetag_shortcut = ">"
			vim.g.closetag_close_shortcut = "<leader>>"
		end,
	},
	{
		"ThePrimeagen/harpoon",
		lazy = false,
		init = function()
			--harpoon map
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")
			vim.keymap.set("n", "<leader>a", mark.add_file)
			vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
		end,
	},
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			vim.keymap.set("i", "<C-q>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-,>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<c-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true, silent = true })
		end,
	},
	{
		"dgagn/diagflow.nvim",
		event = "LspAttach",
		config = function()
			require("diagflow").setup({
				format = function(diagnostic)
					return "[LSP] " .. diagnostic.message
				end,
				show_borders = true,
			})
		end,
		opts = {
			update_event = { "DiagnosticChanged", ... },
      scope = 'line'
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
