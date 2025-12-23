return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		git = { enable = false },
		view = { side = "right" },
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},
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
