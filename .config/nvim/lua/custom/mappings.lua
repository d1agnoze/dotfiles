---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>d"] = { '"_d', "Black hole delete 😎", opts = { nowait = true, remap = true } },
    --harpoon stuffs
		["<C-j>"] = {
			"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
			"switch to harpoon 1",
			opts = { nowait = true, remap = true },
		},
		["<C-k>"] = {
			"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
			"switch to harpoon 2",
			opts = { nowait = true, remap = true },
		},
		["<C-l>"] = {
			"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
			"switch to harpoon 3",
			opts = { nowait = true, remap = true },
		},
		["<C-1>"] = {
			"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
			"switch to harpoon 4",
			opts = { nowait = true, remap = true },
		},
    --Dap stuffs
		["<leader>,x"] = { "<cmd> Dap <CR>", "Initialize DAP" },
	},
	v = {
		[">"] = { ">gv", "indent" },
		["<leader>,b"] = { "<cmd> DapToggleBreakPoint <CR>", "toggle Breakpoint" },
	},
}
M.dap = {
	plugin = true,
	n = {
		["<leader>,b"] = { "<cmd> DapToggleBreakPoint <CR>", "toggle Breakpoint" },
		["<leader>,x"] = { "<cmd> Dap <CR>", "Initialize DAP" },
	},
}
-- more keybinds!
return M
