local M = {}
-- REQUIRED
-- REQUIRED
M.config = function()
  local harpoon = require "harpoon"
  harpoon:setup {}
end

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table { results = file_paths },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end

M.keys = {
  {
    "<leader>a",
    function()
      require("harpoon"):list():add()
    end,
    desc = "harpoon file",
  },
  {
    "<leader>fn",
    function()
      toggle_telescope(require("harpoon"):list())
    end,
    desc = "harpoon menu",
  },
  {
    "<C-h>",
    function()
      require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
    end,
    desc = "harpoon menu",
  },
}
return M
