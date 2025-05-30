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

return M
