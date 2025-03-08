local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		local nmap = function(keys, original, desc, mode)
			mode = mode or "i"
			vim.keymap.set(mode, keys, function()
				return vim.fn.pumvisible() == 1 and original or keys
			end, { buffer = event.buf, desc = "LSP: " .. desc, expr = true, noremap = true })
		end

		map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		map("<leader>fs", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>fd", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>ra", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>fm", vim.lsp.buf.format, "Format code")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("sh", vim.lsp.buf.signature_help, "Lsp function [S]ignature [H]elp")


		map("<C-Space>", "<C-X><C-O>", "[LSP] Trigger Omni Completion", { "i" })
		nmap("<Tab>", "<C-n>", "[LSP] Omni func next item")
		nmap("<S-Tab>", "<C-p>", "[LSP] Omni func next item")
		nmap("<CR>", "<C-y>", "[LSP] Omni func accept item")
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
		format = function(diagnostic)
			return diagnostic.message
		end,
	},
})

lspconfig.rust_analyzer.setup({ capabilities = capabilities })

lspconfig.gopls.setup({ capabilities = capabilities })
