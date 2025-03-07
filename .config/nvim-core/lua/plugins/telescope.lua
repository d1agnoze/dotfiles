return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		pickers = {
			oldfiles = { cwd_only = true },
			buffers = {
				initial_mode = "normal",
				mappings = {
					i = { ["<esc>"] = require("telescope.actions").close },
					n = {
						["dd"] = require("telescope.actions").delete_buffer + require("telescope.actions").move_to_top,
					},
				},
			},
			registers = {
				initial_mode = "normal",
				previewer = true,
			},
		},
	},
}
