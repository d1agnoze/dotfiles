local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    json = { "fixjson", "prettier" },
    cmake = { "cmake_format" },
    cpp = { "clang-format" },
    go = { "gofmt" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    javascript = { "prettierd" },
    javascriptreact = { "prettier" },
    proto = { "buf" },
    bash = { "beautysh" },
    nix = { "nixpkgs-fmt" },
    sql = { "pg_format" },
  },
}

return options
