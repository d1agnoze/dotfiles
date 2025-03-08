local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local action_set = require "telescope.actions.set"

local themePicker = function (opts)
	local current_theme = vim.g.colors_name
	local need_restore = false

	local overrides = opts.overrides or require('telescope.themes').get_dropdown {}

	-- Get colorscheme list and find index of the current theme
	local colorschemes = vim.fn.getcompletion("", "color")
	local current_index = 1

	for i, theme in ipairs(colorschemes) do
		if theme == current_theme then
			current_index = i
			break
		end
	end

	pickers.new(overrides, {
		initial_mode = "normal",
		finder = finders.new_table(colorschemes),
		sorter = conf.generic_sorter({}),
		default_selection_index = current_index,
		on_complete = {
			function()
				local selection = action_state.get_selected_entry()
				if selection == nil then
					return
				end
				need_restore = true
				vim.cmd.colorscheme(selection.value)
			end,
		},
		attach_mappings =  function (bufnr, map) 
			action_set.shift_selection:enhance {
				post = function()
					local selection = action_state.get_selected_entry()
					if selection == nil then
						return
					end
					need_restore = true
					vim.cmd.colorscheme(selection.value)
				end,
			}
			actions.close:enhance {
				post = function()
					if need_restore then
						vim.cmd.colorscheme(current_theme)
					end
					local curr = vim.g.colors_name
					if opts.callback then
						opts.callback(curr)
					end
				end,
			}
			actions.select_default:replace(function() 
				local selection = action_state.get_selected_entry()
				vim.cmd("colorscheme " .. selection[1])
				need_restore = false
				actions.close(bufnr)
			end)

			return true
		end,
	}):find()
end

return { fn = themePicker }
