local opts = {
	animation = false,
	icons = {
		filetype = {
			enabled = false
		}
	}
}
return {
	'romgrk/barbar.nvim',
	init = function() vim.g.barbar_auto_setup = false end,

	config = function()
		require('barbar').setup(opts)
		vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
			callback = vim.schedule_wrap(function()
				vim.cmd.BufferOrderByBufferNumber()
			end)
		})
	end,

	version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
