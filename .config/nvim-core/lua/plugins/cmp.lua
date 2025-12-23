-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	event = "InsertEnter",
-- 	dependencies = {
-- 		{
-- 			"hrsh7th/cmp-nvim-lua",
-- 			"hrsh7th/cmp-nvim-lsp",
-- 			"hrsh7th/cmp-buffer",
-- 			"https://codeberg.org/FelipeLema/cmp-async-path.git",
-- 		},
-- 	},
-- 	config = function()
-- 		local cmp = require("cmp")
-- 		cmp.setup({
-- 			completion = { completeopt = "menu,menuone" },
--
-- 			mapping = {
-- 				["<C-p>"] = cmp.mapping.select_prev_item(),
-- 				["<C-n>"] = cmp.mapping.select_next_item(),
-- 				["<C-d>"] = cmp.mapping.scroll_docs(-4),
-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 				["<C-Space>"] = cmp.mapping.complete(),
-- 				["<C-x>"] = cmp.mapping.close(),
--
-- 				["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
--
-- 				["<Tab>"] = cmp.mapping(function(fallback)
-- 					if cmp.visible() then
-- 						cmp.select_next_item()
-- 					else
-- 						fallback()
-- 					end
-- 				end, { "i", "s" }),
--
-- 				["<S-Tab>"] = cmp.mapping(function(fallback)
-- 					if cmp.visible() then
-- 						cmp.select_prev_item()
-- 					else
-- 						fallback()
-- 					end
-- 				end, { "i", "s" }),
-- 			},
--
-- 			sources = {
-- 				{ name = "nvim_lsp" },
-- 				{ name = "buffer" },
-- 				{ name = "nvim_lua" },
-- 				{ name = "async_path" },
-- 			},
-- 		})
-- 	end,
-- }

return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets" },

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
			["<C-j>"] = { "cancel", "fallback" },
			["<C-k>"] = false,
			["<CR>"] = { "select_and_accept", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },

			["<C-p>"] = { "snippet_forward", "fallback_to_mappings" },
			["<C-n>"] = { "snippet_backward", "fallback_to_mappings" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			documentation = { auto_show = true },
			menu = {
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
				},
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "buffer" },
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = {
			implementation = "prefer_rust",
		},
	},
	opts_extend = { "sources.default" },
}
