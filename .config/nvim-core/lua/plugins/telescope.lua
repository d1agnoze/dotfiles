local lsp_filter = {
	"Class",
	"Constant",
	"Enum",
	"EnumMember",
	"Function",
	"Interface",
	"Namespace",
	"Method",
	-- "Struct", "Array", "Boolean", "Constructor", "Event", "Field", "File", "Key", , "Module", "Null", "Number", "Object",
	-- "Operator", "Package", "Property", "String", "TypeParameter", "Variable",
}

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						height = 0.5, -- Reduce the height of the telescope window
						preview_cutoff = 120, -- Hide preview if window is too small
						prompt_position = "top",
					},
				},
				sorting_strategy = "ascending",
				mappings = {
					n = {
						["<C-c>"] = actions.close,
						["q"] = actions.close,
					},
				},
			},
			pickers = {
				oldfiles = { cwd_only = true },
				lsp_references = { initial_mode = "normal" },
				lsp_document_symbols = {
					layout_config = {
						height = 0.8,
					},
					initial_mode = "normal",
					theme = "dropdown",
					symbols = lsp_filter,
					mappings = { n = { ["<C-c>"] = actions.close } },
					previewer = false,
				},
				diagnostics = {
					initial_mode = "normal",
					mappings = { n = { ["<C-c>"] = actions.close } },
				},
				lsp_definitions = { initial_mode = "normal", mappings = { n = { ["<C-c>"] = actions.close } } },
				git_status = { initial_mode = "normal", mappings = { n = { ["<C-c>"] = actions.close } } },
				buffers = {
					initial_mode = "normal",
					mappings = {
						i = { ["<esc>"] = actions.close },
						n = { ["dd"] = actions.delete_buffer + actions.move_to_top, ["<C-c>"] = actions.close },
					},
				},
				registers = { initial_mode = "normal", previewer = true },
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						initial_mode = "normal",
					}),
				},
			},
		})

		require("telescope").load_extension("ui-select")
	end,
}
