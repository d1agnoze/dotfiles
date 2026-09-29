return function()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "[✔]",   -- Installed
				package_pending = "[~]",     -- Pending
				package_uninstalled = "[X]", -- Uninstalled
			},
		},
	})
end
