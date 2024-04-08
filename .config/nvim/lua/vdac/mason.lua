local M = {}
-- INFO: LSP, DAP, LINTER, FORMATTER
M.ensure_installed = {
  --LS
  "lua-language-server",
  "html-lsp",
  "css-lsp",
  "typescript-language-server",
  "emmet-ls",
  "clangd",
  "tailwindcss-language-server",
  "cmake-language-server",
  "bash-language-server",
  "gopls",

  -- LINTER
  "cmakelang",

  -- FORMATTER
  "stylua",
  "clang-format",
  "prettier",
  "prettierd",
}
return M
