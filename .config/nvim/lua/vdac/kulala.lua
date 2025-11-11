local function kulalaRun()
  require("kulala").run()
end

local function kulalaEnv()
  require("kulala").set_selected_env()
end

local M = {}

M.global_keymaps = {
  ["Send request"] = { "<leader>ks", kulalaRun, mode = { "n", "v" }, desc = "Kulala: Send request" },
  ["Select environment"] = { "<leader>ke", kulalaEnv, ft = { "http", "rest" }, desc = "Kulala: Pick env" },
  ["Find request"] = false, -- set to false to disable
}

M.ui = {
  display_mode = "float",
  ---@type vim.api.keyset.win_config
  win_opts = {
    relative = "editor",
    row = 5,
    col = vim.o.columns,
    width = 60,
    style = "minimal",
    -- height = 20,
  },
}
return M
