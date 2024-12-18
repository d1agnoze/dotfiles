---@class LspConf
---@field name string plugin's name
---@field cmd string cmd name

---@class Bootstrap
---@field treesitter string[]
---@field lsp LspConf[]
---@field daps string[]
---@field linters string[]
---@field fmts string[]
local M = {}

M.lsp = {
  { name = "bash-language-server", cmd = "bashls" },
  { name = "buf-language-server", cmd = "buf_ls" },
  { name = "clangd", cmd = "clangd" },
  { name = "cmake-language-server", cmd = "cmake" },
  { name = "css-lsp", cmd = "cssls" },
  { name = "emmet-ls", cmd = "emmet_ls" },
  { name = "gopls", cmd = "gopls" },
  { name = "html-lsp", cmd = "html" },
  { name = "html-lsp", cmd = "html" },
  { name = "lua-language-server", cmd = "lua_ls" },
  { name = "svelte-language-server", cmd = "svelte" },
  { name = "tailwindcss-language-server", cmd = "tailwindcss" },
  { name = "typescript-language-server", cmd = "ts_ls" },
  { name = "docker-compose-language-service", cmd = "docker_compose_language_service" },
  { name = "dockerfile-language-server", cmd = "dockerls" },
}

M.daps = {
  "cpptools",
  "go-debug-adapter",
}

M.fmts = {
  "stylua",
  "cmakelang",
  "buf",
  "clang-format",
  "prettier",
  "prettierd",
  "beautysh",
}

M.linters = {
  "buf",
  "cmakelang",
  "golangci-lint-langserver",
}

M.treesitter = {
  "bash",
  "c",
  "cpp",
  "css",
  "go",
  "gotmpl",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "json5",
  "lua",
  "markdown",
  "markdown_inline",
  "proto",
  "python",
  "query",
  "rust",
  "svelte",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "vue",
}

return M
