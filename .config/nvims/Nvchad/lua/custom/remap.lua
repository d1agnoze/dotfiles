vim.keymap.set("v","J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v","K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n","Y", "yg$")
vim.keymap.set("n","J", "mzJ`z")
vim.keymap.set("n","<C-d>", "<C-d>zz")
vim.keymap.set("n","<C-u>", "<C-u>zz")
vim.keymap.set("n","N", "Nzzzv")
vim.keymap.set("n","n", "nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")


--harpoon stuffs
--local ui = require("harpoon.ui")
--vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
--vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
--vim.keymap.set("n", "<C-1>", function() ui.nav_file(3) end)
--vim.keymap.set("n", "<C-2>", function() ui.nav_file(4) end)

