vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle NVIM tree", noremap = true, silent = true })
