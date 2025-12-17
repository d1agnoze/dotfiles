-- add yours here!
--
local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- o.hlsearch = false
o.incsearch = true
o.nu = true
o.relativenumber = true
o.statuscolumn = "%s %l %r "
o.wrap = false
o.clipboard = "unnamedplus"
o.foldenable = false
o.tabstop = 8

vim.filetype.add({
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["compose.yaml"] = "yaml.docker-compose",
	},
})

vim.fn.sign_define("DapBreakpoint", { text = "✋", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🛑", texthl = "", linehl = "", numhl = "" })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf" },
	callback = function()
		vim.keymap.set("n", "<CR>", "<CR>")
	end,
})

vim.api.nvim_set_hl(0, "Visual", { bg = "#1d600f" })
