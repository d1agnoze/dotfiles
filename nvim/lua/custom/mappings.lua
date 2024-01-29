---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>d"] = { "\"_d", "Black hole delete 😎", opts = { nowait = true , remap= true} },
    ["<C-j>"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "switch to harpoon 1", opts = { nowait = true , remap= true} },
    ["<C-k>"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "switch to harpoon 2", opts = { nowait = true , remap= true} },
    ["<C-l>"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "switch to harpoon 3", opts = { nowait = true , remap= true} },
    ["<C-1>"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "switch to harpoon 4", opts = { nowait = true , remap= true} },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}
-- more keybinds!
return M
