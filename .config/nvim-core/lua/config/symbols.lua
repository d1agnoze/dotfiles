local excluded_symbols = { String = true, Variable = true }
local symbols_wins = {}

local function open_symbols()
	local source_win = vim.api.nvim_get_current_win()
	local tab = vim.api.nvim_get_current_tabpage()

	vim.lsp.buf.document_symbol({
		on_list = function(options)
			for i = #options.items, 1, -1 do
				if excluded_symbols[options.items[i].kind] then
					table.remove(options.items, i)
				end
			end

			vim.api.nvim_win_call(source_win, function()
				vim.fn.setloclist(0, {}, " ", options)
				vim.cmd("lopen")
				vim.cmd("wincmd L")
				vim.cmd("vertical resize 30")
				symbols_wins[tab] = vim.api.nvim_get_current_win()
			end)
		end,
	})
end

local function toggle_symbols()
	local tab = vim.api.nvim_get_current_tabpage()
	local symbols_win = symbols_wins[tab]

	if symbols_win and vim.api.nvim_win_is_valid(symbols_win) then
		vim.api.nvim_win_close(symbols_win, true)
		symbols_wins[tab] = nil
		return
	end

	open_symbols()
end

vim.keymap.set("n", "gO", open_symbols, { desc = "LSP document symbols" })
vim.keymap.set("n", "<leader>lis", toggle_symbols, { desc = "Toggle LSP symbols" })
