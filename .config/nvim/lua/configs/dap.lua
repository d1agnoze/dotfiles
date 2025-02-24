local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

local vscode = require "dap.ext.vscode"
vscode.type_to_filetypes["node"] = js_filetypes
vscode.type_to_filetypes["pwa-node"] = js_filetypes

require("dap-vscode-js").setup {
  debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug",
  adapters = { "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
}

require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      vim.fn.stdpath "data" .. "/lazy/vscode-js-debug/out/src/vsDebugServer.js",
      "${port}",
    },
  },
}

local dap = require "dap"
if not dap.adapters["node"] then
  dap.adapters["node"] = function(cb, config)
    if config.type == "node" then
      config.type = "pwa-node"
    end
    local nativeAdapter = dap.adapters["pwa-node"]
    if type(nativeAdapter) == "function" then
      nativeAdapter(cb, config)
    else
      cb(nativeAdapter)
    end
  end
end

for _, language in ipairs(js_filetypes) do
  if not dap.configurations[language] then
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }
  end
end
