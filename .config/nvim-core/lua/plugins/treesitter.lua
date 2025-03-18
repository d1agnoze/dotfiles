return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	opts = {
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
	},
}
