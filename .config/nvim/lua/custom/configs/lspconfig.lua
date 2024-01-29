local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})
-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "bashls", "gopls", "tailwindcss"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local cmp_nvim_lsp = require "cmp_nvim_lsp"
local configs = require 'lspconfig.configs'

if not configs.asmlsp then
  configs.asmlsp = {
    default_config = {
      cmd = { 'asm-lsp' },
      root_dir = lspconfig.util.root_pattern(''),
      filetypes = { 'asm' },
    },
  }
end
lspconfig.asmlsp.setup {
}


require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
-- 
-- lspconfig.pyright.setup { blabla}
