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

-- -- Set the statusline
-- vim.o.statusline = '%!v:lua.Statusline()'
--
-- -- Optional: Update statusline when switching buffers
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
-- 	pattern = '*',
-- 	callback = function()
-- 		vim.o.statusline = '%!v:lua.Statusline()'
-- 	end,
-- })
