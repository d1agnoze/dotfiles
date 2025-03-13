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

	vim.fn.setloclist(0, {}, ' ', options)
	vim.cmd.lopen()
end

local function document_symbol ()
	vim.lsp.buf.document_symbol{ on_list = on_list }
end

vim.keymap.set("n", "<leader>lis", document_symbol , {desc = "document_symbol"} )
