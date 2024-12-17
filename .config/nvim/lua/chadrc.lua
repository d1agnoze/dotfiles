-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Visual = { bg = "green", fg = "black" },
    TelescopeSelection = { bg = "#32CD32", fg = "black" },
    MiniMapNormal = { bg = "NONE" },
  },
  transparency = true,
  theme = "material-darker",
}
M.nvdash = {
  load_on_startup = true,
  header = {
    "        ⠀⠀⠀⠀⢀⣴⣶⠿⠟⠻⠿⢷⣦⣄⠀⠀⠀        ",
    "        ⠀⠀⠀⠀⣾⠏⠀⠀⣠⣤⣤⣤⣬⣿⣷⣄⡀        ",
    "        ⠀⢀⣀⣸⡿⠀⠀⣼⡟⠁⠀⠀⠀⠀⠀⠙⣷        ",
    "        ⢸⡟⠉⣽⡇⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⢀⣿        ",
    "        ⣾⠇⠀⣿⡇⠀⠀⠘⠿⢶⣶⣤⣤⣶⡶⣿⠋        ",
    "        ⣿⠂⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠃        ",
    "        ⣿⡆⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀        ",
    "        ⢿⡇⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠀        ",
    "        ⠘⠻⠷⢿⡇⠀⠀⠀⣴⣶⣶⠶⠖⠀⢸⡟⠀        ",
    "        ⠀⠀⠀⢸⣇⠀⠀⠀⣿⡇⣿⡄⠀⢀⣿⠇⠀        ",
    "        ⠀⠀⠀⠘⣿⣤⣤⣴⡿⠃⠙⠛⠛⠛⠋⠀⠀        ",
  },
}
M.ui = {
  telescope = { style = "bordered" },
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored",
  },
}
M.term = {
  float = {
    row = 0.25,
    col = 0.15,
    width = 0.7,
    height = 0.6,
  },
}

return M
