require("dapui").setup()

local dap, dapui = require "dap", require "dapui"
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.after.event_initialized.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.keymap.set("n", "<space>de", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "debuger evaluate", noremap = true, silent = true })
