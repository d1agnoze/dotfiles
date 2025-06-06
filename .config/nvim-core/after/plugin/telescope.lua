local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>ft", builtin.colorscheme, { desc = "Telescope theme" })
vim.keymap.set("n", "<leader>gt", builtin.git_status, { desc = "Telescope git status" })
