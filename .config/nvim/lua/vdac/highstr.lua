local opts = {
  verbosity = 0,
  saving_path = "/tmp/highstr/",
  highlight_colors = {
    color_0 = { "#FB4141", "smart" },
    color_1 = { "#5CB338", "smart" },
    color_2 = { "#7FFFD4", "smart" },
    color_3 = { "#8A2BE2", "smart" },
    color_4 = { "#FFC145", "smart" },
    color_5 = { "#FF8383", "smart" },
    color_6 = { "#08C2FF", "smart" },
    color_7 = { "#FFC0CB", "smart" },
    color_8 = { "#FFF9E3", "smart" },
    color_9 = { "#0D7C66", "smart" },
  },
}

local genMap = function()
  local index = 1
  for _, _ in pairs(opts.highlight_colors) do
    vim.keymap.set(
      "v",
      "<leader>h" .. index,
      ":<c-u>HSHighlight " .. (index - 1) .. "<CR>",
      { desc = "Highlight with slot " .. index, silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>h" .. index,
      "viw:<c-u>HSHighlight " .. (index - 1) .. "<CR>",
      { desc = "[Normal] Highlight with slot " .. index, silent = true }
    )
    index = index + 1
  end
end

local M = {
  opts = opts,
  config = function()
    genMap()
  end,
}
return M
