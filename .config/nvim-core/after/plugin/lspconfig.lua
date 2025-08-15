local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

--- Update status line
vim.api.nvim_create_autocmd("LspProgress", {
	callback = function()
		vim.cmd("redrawstatus")
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		-- local client = vim.lsp.get_client_by_id(event.data.client_id)
		-- if client and client:supports_method("textDocument/completion") then
		-- 	vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
		-- end

		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- local nmap = function(keys, original, desc, mode)
		-- 	mode = mode or "i"
		-- 	vim.keymap.set(mode, keys, function()
		-- 		return vim.fn.pumvisible() == 1 and original or keys
		-- 	end, { buffer = event.buf, desc = "LSP: " .. desc, expr = true, noremap = true })
		-- end

		map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
		map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
		map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		map("<leader>ds", require("telescope.builtin").diagnostics, "Type [D]efinition")
		map("<leader>fd", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>ra", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>fm", vim.lsp.buf.format, "Format code")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("sh", vim.lsp.buf.signature_help, "Lsp function [S]ignature [H]elp")
	end,
})

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	virtual_text = {
		source = "if_many",
		spacing = 2,
	},
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			hint = { enable = true },
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
					vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
					vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
					"${3rd}/luv/library",
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

vim.lsp.enable("rust_analyzer")
vim.lsp.enable("gopls")
vim.lsp.enable("lua_ls")
-- vim.cmd("set completeopt+=noselect")
