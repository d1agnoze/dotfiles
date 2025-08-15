return {
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
}
