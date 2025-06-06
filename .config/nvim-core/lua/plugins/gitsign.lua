return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			local function opts(desc)
				return { buffer = bufnr, desc = desc }
			end
			local map = vim.keymap.set
			map("n", "<leader>rh", gs.reset_hunk, opts "Reset Hunk")
			map("n", "<leader>hd", gs.diffthis, opts "Git diff")
			map("n", "<leader>gb", gs.blame_line, opts "Blame Line")
		end,
	},
}
