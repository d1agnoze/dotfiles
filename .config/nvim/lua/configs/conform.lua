local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    cmake = { "cmake_format" },
    cpp = { "clang-format" },
    go = { "gofmt" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    javascript = { "prettierd" },
    javascriptreact = { "prettier" },
    proto = { "buf" },
    bash = { "beautysh" },
  },
}

require("conform").setup(options)
