require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- o.hlsearch = false
o.incsearch = true
o.nu = true
o.relativenumber = true
o.statuscolumn = "%s %l %r "
o.wrap = false
o.clipboard = "unnamedplus"

o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = false
o.tabstop  = 4

vim.filetype.add {
  filename = {
    ["docker-compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["compose.yaml"] = "yaml.docker-compose",
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "✋", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🛑", texthl = "", linehl = "", numhl = "" })

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

