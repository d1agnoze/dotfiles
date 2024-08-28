local M = {}
-- INFO: LSP, LINTER, FORMATTER
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
  "rust-analyzer",

  --DAP
  "cpptools",
  "go-debug-adapter",
  "codelldb",

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
  "ast-grep",
}
return M
