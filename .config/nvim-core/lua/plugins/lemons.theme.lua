return {
	"Kaikacy/Lemons.nvim",
	version = "*", -- for stable release
	lazy = false,
	priority = 1000,
	config = function()
		require("lemons").setup()
	end,
}
