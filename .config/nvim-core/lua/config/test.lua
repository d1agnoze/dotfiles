local lsp_filter = {
	-- "Array",
	-- "Boolean",
	"Class",
	"Constant",
	-- "Constructor",
	"Enum",
	"EnumMember",
	-- "Event",
	-- "Field",
	-- "File",
	"Function",
	"Interface",
	-- "Key",
	-- "Method",
	-- "Module",
	"Namespace",
	-- "Null",
	-- "Number",
	-- "Object",
	-- "Operator",
	-- "Package",
	-- "Property",
	-- "String",
	"Struct",
	-- "TypeParameter",
	-- "Variable",
}

---@param options vim.lsp.LocationOpts.OnList
local function on_list(options)
	for i = #options.items, 1, -1 do
		if not vim.tbl_contains(lsp_filter, options.items[i].kind) then
			table.remove(options.items, i)
		end
	end

	local lines = {}
	for i, opt in pairs(options.items) do
		local func_name = string.match(opt.text, '%[.-%]%s+(.*)')
		-- options.items[i].text = func_name
		table.insert(lines, options.items[i].text)
	end


	-- Create a new buffer and open it in a vsplit
	local buf = vim.api.nvim_create_buf(false, true) -- Not listed, scratch buffer
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_set_option_value('buftype', 'nofile', { buf = buf })
	vim.api.nvim_set_option_value('modifiable', false, { buf = buf })

	---@type vim.api.keyset.win_config
	local win_opts = {
		win   = -1,
		width = math.floor(vim.o.columns * 0.2),
		split = "right"
	}
	vim.api.nvim_open_win(buf, false, win_opts)

	-- Set up keymap for jumping on Enter
	vim.api.nvim_buf_set_keymap(buf, 'n', '<CR>', '', {
		noremap = true,
		silent = true,
		callback = function()
			local line = vim.api.nvim_get_current_line()
			local item = options.items[line]
			if item then
				vim.lsp.util.jump_to_location(item, 'utf-8', true)
			end
		end,
	})
end

local function document_symbol()
	vim.lsp.buf.document_symbol { on_list = on_list }
end
