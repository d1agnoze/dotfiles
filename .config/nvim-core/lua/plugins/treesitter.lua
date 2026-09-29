return function()
	local ensureInstalled = { "lua", "bash", "go" }
	local alreadyInstalled = require("nvim-treesitter.config").get_installed()
	require("nvim-treesitter-textobjects").setup({ select = { enable = true, lookahead = true } })
	vim.keymap.set({ "x", "o" }, "af", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
	end)
	vim.keymap.set({ "x", "o" }, "if", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
	end)

	local parsersToInstall = vim.iter(ensureInstalled)
		:filter(function(parser)
			return not vim.tbl_contains(alreadyInstalled, parser)
		end)
		:totable()

	require("nvim-treesitter").install(parsersToInstall)

	vim.api.nvim_create_autocmd("FileType", {
		callback = function()
			pcall(vim.treesitter.start)
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	})
end
