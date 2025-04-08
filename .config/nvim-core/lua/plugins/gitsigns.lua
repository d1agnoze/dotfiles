return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			vim.keymap.set(
				"n",
				"<leader>rh",
				package.loaded.gitsigns.reset_hunk,
				{ buffer = bufnr, desc = "GitSigns Reset Hunk" }
			)
			vim.keymap.set(
				"n",
				"<leader>gb",
				package.loaded.gitsigns.blame_line,
				{ buffer = bufnr, desc = "GitSigns Blame Line" }
			)
		end,
	},
}
