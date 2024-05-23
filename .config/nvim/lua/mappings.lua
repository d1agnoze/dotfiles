require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected line up" })
map("n", "Y", "yg$", { desc = "yank to $reg" })
map("n", "J", "mzJ`z", { desc = "wrap below line" })
map("n", "<C-d>", "<C-d>zz", { desc = "scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up" })
map("n", "N", "Nzzzv", { desc = "Prev find" })
map("n", "n", "nzzzv", { desc = "Next find" })
map("x", "<leader>p", '"_dP', { desc = "" })
map("v", "<leader>y", '"+y', { desc = "yank to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "yank to clipboard" })

map("i", "<C-c>", "<Esc>", { desc = "change ctrl+c to ESC" })
map("n", "<leader>lua", ":luafile %", { desc = "run current lua file" })

map("n", "<leader>rp", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "find and replace current word" })
map(
  "v",
  "<leader>rp",
  ":s/\\(\\)/\\1/g<Left><Left><Left><Left><Left><Left><Left>",
  { desc = "find and replace selection" }
)

map("n", "<leader>ll", "zR", { noremap = true, desc = "open all folds" })
map("n", "<leader>la", "zM", { noremap = true, desc = "close all folds" })
map("n", "<leader>lc", "zA", { noremap = true, desc = "Toggle all folds under cursor" })

-- Remap telescope do find dotfiles
map(
  "n",
  "<leader>ff",
  "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
  { noremap = true, desc = "find files" }
)

map("n", "<leader>cl", "_vg_", { noremap = true, desc = "select line" })

-- INFO: UNMAP
vim.keymap.del("n", "<leader>v")
vim.keymap.del("n", "<leader>h")

--Harpoon
map(
  "n",
  "<C-h>",
  ":lua  require 'harpoon'.ui:toggle_quick_menu(require 'harpoon':list())<CR>",
  { desc = "harpoon quick menu", silent = true }
)
map("n", "<C-j>", ":lua  require 'harpoon':list():select(1)<CR>", { desc = "harpoon to file 1", silent = true })
map("n", "<C-k>", ":lua  require 'harpoon':list():select(2)<CR>", { desc = "harpoon to file 2", silent = true })
map("n", "<C-l>", ":lua  require 'harpoon':list():select(3)<CR>", { desc = "harpoon to file 3", silent = true })


--Command to open Mason, Lsp, Conform, Lazy
map("n", "<leader>sm", ":Mason<CR>", { desc = "Open Mason", silent = true })
map("n", "<leader>ss", ":LspInfo<CR>", { desc = "Open LspInfo", silent = true })
map("n", "<leader>sl", ":Lazy<CR>", { desc = "Open Lazy", silent = true })
map("n", "<leader>sc", ":ConformInfo<CR>", { desc = "Open Conform", silent = true })
