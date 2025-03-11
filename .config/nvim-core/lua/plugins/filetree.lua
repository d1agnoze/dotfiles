return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		git = { enable = false },
		view = { side = "right" },
		renderer = {
			icons = {
				glyphs = {
					default = "-",
					symlink = "~",
					bookmark = "*",
					modified = "+",
					hidden = ".",
					folder = {
						arrow_closed = ">",
						arrow_open = "",
						default = "[+]",
						open = "[-]",
						empty = "[ ]",
						empty_open = "[_]",
						symlink = "[~]",
						symlink_open = "[~]",
					},
					git = { untracked = "" },
				},
			},

		},
	},
}
