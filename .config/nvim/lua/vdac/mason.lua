local M = {}
-- INFO: LSP, LINTER, FORMATTER
-- INFO: DAP is installed via mason-nvim-dap, checkout vdac/mason-dap
M.ensure_installed = {
  --LSP
  "bash-language-server",
  "buf-language-server",
  "clangd",
  "cmake-language-server",
  "css-lsp",
  "emmet-ls",
  "gopls",
  "html-lsp",
  "lua-language-server",
  "svelte-language-server",
  "tailwindcss-language-server",
  "typescript-language-server",

  -- LINTER
  "buf",
  "cmakelang",

  -- FORMATTER
  "stylua",
  "cmakelang",
  "buf",
  "clang-format",
  "prettier",
  "prettierd",
  "beautysh",
}
return M
