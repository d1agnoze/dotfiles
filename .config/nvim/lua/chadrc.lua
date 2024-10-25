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
  theme = "material-darker",
  -- transparency = true,
}

return M
