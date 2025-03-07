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

-- vim.cmd([[colorscheme moonfly]])
local function pick_colorscheme()
	local colorschemes = vim.fn.getcompletion("", "color") -- Get available colorschemes
	vim.ui.select(colorschemes, { prompt = "Select a colorscheme:" }, function(choice)
		if choice then
			vim.cmd("colorscheme " .. choice) -- Apply the selected colorscheme
			save_colorscheme(choice) -- Save the selection
		end
	end)
end

load_colorscheme()

vim.keymap.set("n", "<leader>th", pick_colorscheme, { noremap = true, silent = true })
