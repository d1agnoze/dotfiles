function Statusline()
	local parts = {}

	-- Buffet list
	local loaded_bufs = {}

	for _, buf in pairs(vim.api.nvim_list_bufs()) do
		if vim.fn.buflisted(buf) == 1 then
			table.insert(loaded_bufs, buf)
		end
	end

	-- Create buffer list
	for i, buf in pairs(loaded_bufs) do
		if buf == vim.api.nvim_get_current_buf() then
			table.insert(parts, '%#Question# ' .. i .. ' %*') -- i like this highlight
		else
			table.insert(parts, '%#Conceal# ' .. i .. ' %*')
		end
	end

	local lsp_status = vim.lsp.status()

	-- Add some additional statusline info (optional)
	table.insert(parts, '%#StatusLine#') -- Reset to default StatusLine highlight
	table.insert(parts, ' %f')    -- File name
	table.insert(parts, '%m')     -- Modified flag
	table.insert(parts, '%=%y')   -- Readonly flag (right-aligned)
	table.insert(parts, ' ' .. lsp_status .. '')

	table.insert(parts, ' %l:%c ') -- Line:column
	table.insert(parts, '%p%% ') -- Percentage through file

	return table.concat(parts)
end

function Tabline()
	local parts = {}

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.fn.buflisted(buf) == 1 then
			local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
			if name == "" then name = "[No Name]" end
			if vim.bo[buf].modified then name = name .. " +" end
			name = name:gsub("%%", "%%%%")

			local highlight = buf == vim.api.nvim_get_current_buf() and "TabLineSel" or "TabLine"
			table.insert(parts, "%#" .. highlight .. "# " .. name .. " ")
		end
	end

	return table.concat(parts) .. "%#TabLineFill#"
end

-- Set the statusline
vim.o.statusline = '%!v:lua.Statusline()'
vim.o.tabline = "%!v:lua.Tabline()"
vim.o.showtabline = 2
--
-- -- Optional: Update statusline when switching buffers
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
-- 	pattern = '*',
-- 	callback = function()
-- 		vim.o.statusline = '%!v:lua.Statusline()'
-- 	end,
-- })
