local plugins = {
	"filetree",
	"gitsign",
	"indent_line",
	"lemons_theme",
	"mason",
	"telescope",
	"todo",
	"treesitter",
}

return {
	setup = function()
		require("nvim-autopairs").setup({})

		for _, plugin in ipairs(plugins) do
			require("plugins." .. plugin)()
		end
	end,
}
