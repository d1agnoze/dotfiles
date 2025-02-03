local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
    null_ls.builtins.code_actions.impl,
    -- null_ls.builtins.code_actions.gomodifytags,
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.codespell,
    -- null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.diagnostics.dotenv_linter,
  },
}
