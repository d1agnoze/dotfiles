require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.hlsearch = false
o.incsearch = true
o.nu = true
o.relativenumber = true
o.statuscolumn = "%s %l %r "
o.wrap = false
o.clipboard = "unnamedplus"

o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = false
-- o.foldlevel = 99

local nvtree = require "nvchad.configs.nvimtree"
nvtree.view.side = "right"

vim.opt.fillchars:append { diff = "╱" }
