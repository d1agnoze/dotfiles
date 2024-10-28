-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Visual = { bg = "green", fg = "black" },
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
  -- buttons = {
  --   { "  Find File", "Spc f f", "Telescope find_files" },
  --   { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
  --   { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
  --   { "  Themes", "Spc t h", "Telescope themes" },
  --   { "  Mappings", "Spc c h", "NvCheatsheet" },
  -- },
}
M.ui = {
  telescope = { style = "bordered" },
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored",
  },
}

return M
