local dapr = require "dap"
local dapui = require "dapui"
dapui.setup()
dapr.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dapr.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dapr.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
