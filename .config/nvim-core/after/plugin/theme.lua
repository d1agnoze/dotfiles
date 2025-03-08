local colorscheme_file = vim.fn.stdpath("data") .. "/nvim-lite/theme.txt" -- File to save the colorscheme

local function save_colorscheme(name)
	local file = io.open(colorscheme_file, "w")
	if file then
		file:write(name)
		file:close()
	end
end

local function load_colorscheme()
	local file = io.open(colorscheme_file, "r")
	if file then
		local colorscheme = file:read("*l")
		file:close()
		if colorscheme and colorscheme ~= "" then
			vim.cmd("colorscheme " .. colorscheme)
		end
	end
end

load_colorscheme()

function pick() 
	require('config.telescope').fn({overrides = nil, callback = save_colorscheme})
end

vim.keymap.set("n", "<leader>th", pick, { noremap = true, silent = true })
