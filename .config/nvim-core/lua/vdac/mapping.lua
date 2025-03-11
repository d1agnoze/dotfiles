local map = vim.keymap.set

map('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true, desc = "noh" })
map('v', 'o', 'g_', { noremap = true, silent = true, desc = "Visual go to end of line" })
map("n", "<C-s>", ":update<CR>", { desc = "Save file if modified" })
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
map("n", "<leader>rp", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "find and replace current word" })
map(
	"v",
	"<leader>rp",
	":s/\\(\\)/\\1/g<Left><Left><Left><Left><Left><Left><Left>",
	{ desc = "find and replace selection" }
)

-- Remap telescope do find dotfiles
map(
	"n",
	"<leader>ff",
	"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
	{ noremap = true, desc = "find files" }
)

map("n", "<leader>cl", "_vg_", { noremap = true, desc = "select line" })
--Command to open Mason, Lsp, Conform, Lazy
map("n", "<leader>sm", ":Mason<CR>", { desc = "Open Mason", silent = true })
map("n", "<leader>ss", ":LspInfo<CR>", { desc = "Open LspInfo", silent = true })
map("n", "<leader>sl", ":Lazy<CR>", { desc = "Open Lazy", silent = true })
map("n", "<leader>fk", "<CMD>:Telescope keymaps<CR>", { desc = "Telescope keymaps", silent = true })
map("n", "<leader>ts", function()
	local current_tabstop = vim.o.tabstop
	if current_tabstop == 8 then
		vim.o.tabstop = 2
		vim.o.shiftwidth = 2
		vim.o.softtabstop = 2
		print("Tabstop set to 2")
	else
		vim.o.tabstop = 8
		vim.o.shiftwidth = 8
		vim.o.softtabstop = 8
		print("Tabstop set to 8")
	end
end, { desc = "Toggle tabstop between 8 and 2" })

map("n", "<leader>fr", "<cmd>Telescope registers<CR>", { noremap = true, silent = true, desc = "Telescope registers" })
map('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true, desc = "Buffer next" })
map('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true, desc = "Buffer previous" })
map('n', '<leader>x', ':q<CR>', { noremap = true, silent = true, desc = "Quit Buffer" })
map('n', '<leader>lx', ':luafile %<CR>', { noremap = true, silent = true, desc = "Execute current lua file" })
map("n", "<C-m>", "<cmd>TSToggle highlight<CR>", { desc = "[Treesitter] toggle syntax highlghting", noremap = true })
