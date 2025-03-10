return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
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
			},
			pickers = {
				oldfiles = { cwd_only = true },
				lsp_references = { initial_mode = "normal" },
				lsp_document_symbols = { initial_mode = "normal" },
				lsp_definitions = { initial_mode = "normal" },
				git_status = { initial_mode = "normal" },
				buffers = {
					initial_mode = "normal",
					mappings = {
						i = { ["<esc>"] = actions.close },
						n = { ["dd"] = actions.delete_buffer + actions.move_to_top },
					},
				},
				registers = { initial_mode = "normal", previewer = true },
			},
		})
	end,
}
