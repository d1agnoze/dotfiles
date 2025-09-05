require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected line up" })
map("n", "Y", "yg$", { desc = "yank to $reg" })
map("n", "J", "mzJ`z", { desc = "wrap below line" })
map("n", "<C-d>", "<C-d>zz", { desc = "scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up" })
map("n", "N", "Nzzzv", { desc = "Prev find" })
map("n", "n", "nzzzv", { desc = "Next find" })
map("x", "<leader>p", '"_dP', { desc = "" })
map("v", "<leader>y", '"+y', { desc = "yank to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "yank to clipboard" })

map("i", "<C-c>", "<Esc>", { desc = "change ctrl+c to ESC" })
map("n", "<leader>lua", ":luafile %", { desc = "run current lua file" })

map("n", "<leader>rp", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "find and replace current word" })
map(
  "v",
  "<leader>rp",
  ":s/\\(\\)/\\1/g<Left><Left><Left><Left><Left><Left><Left>",
  { desc = "find and replace selection" }
)

map("n", "<leader>ll", "zR", { noremap = true, desc = "open all folds" })
map("n", "<leader>la", "zM", { noremap = true, desc = "close all folds" })
map("n", "<leader>lc", "zA", { noremap = true, desc = "Toggle all folds under cursor" })

-- Remap telescope do find dotfiles
map(
  "n",
  "<leader>ff",
  "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
  { noremap = true, desc = "find files" }
)

map("n", "<leader>cl", "_vg_", { noremap = true, desc = "select line" })

vim.keymap.del("n", "<leader>v")
vim.keymap.del("n", "<leader>h")

--Harpoon
map(
  "n",
  "<C-h>",
  ":lua  require 'harpoon'.ui:toggle_quick_menu(require 'harpoon':list())<CR>",
  { desc = "harpoon quick menu", silent = true }
)
map("n", "<S-w>", ":lua  require 'harpoon':list():select(1)<CR>", { desc = "harpoon to file 1", silent = true })
map("n", "<S-e>", ":lua  require 'harpoon':list():select(2)<CR>", { desc = "harpoon to file 2", silent = true })
map("n", "<S-r>", ":lua  require 'harpoon':list():select(3)<CR>", { desc = "harpoon to file 3", silent = true })

--Command to open Mason, Lsp, Conform, Lazy
map("n", "<leader>sm", ":Mason<CR>", { desc = "Open Mason", silent = true })
map("n", "<leader>ss", ":LspInfo<CR>", { desc = "Open LspInfo", silent = true })
map("n", "<leader>sl", ":Lazy<CR>", { desc = "Open Lazy", silent = true })

--Lsp inlay hint: Neovim 0.10
map("n", "<leader>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  vim.cmd "DapVirtualTextToggle"
end, { desc = "toggle inlay hint ( and DAP virtual text)", noremap = true, silent = false })

-- command mode
map("c", "<C-k>", "\\(\\)<Left><Left>", { noremap = true, silent = true })
map("c", "<C-l>", "\\w*", { noremap = true, silent = true })

---extra telescope mappings
local builtin = require "telescope.builtin"
map("n", "<leader>fd", builtin.lsp_dynamic_workspace_symbols, { desc = "lsp dynamic workspace symbols", silent = true })
local function symbol_search()
  vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
    if not query then
      return
    end
    if query == "" then
      query = vim.fn.expand "<cword>"
    end
    builtin.lsp_workspace_symbols { query = query, prompt_title = ("Find word (%s)"):format(query) }
  end)
end

map("n", "<leader>fs", symbol_search, { desc = "lsp workspace symbols", silent = true })
map("n", "<leader>fk", "<CMD>:Telescope keymaps<CR>", { desc = "Telescope keymaps", silent = true })
map("n", "<leader>fl", "<CMD>:Lspsaga finder<CR>", { desc = "lspsaga symbols finder", silent = true })
map("n", "<leader>dl", function()
  require("telescope").extensions.dap.commands {}
end, { desc = "lspsaga code_action", silent = true, noremap = true })
--
-- TOGGLE TRANSPARENCY
map("n", "<leader>de", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "DAP evaluate", noremap = true, silent = true })

map("n", "<leader>tR", function()
  require("base46").toggle_transparency()
end, { desc = "toggle transparency" })

map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "DAP continue", noremap = true, silent = true })

map("n", "<F5>", function()
  require("dap").restart()
end, { desc = "DAP restart" })

map("n", "<F9>", function()
  require("dap").step_over()
end, { desc = "DAP step over" })

map("n", "<F10>", function()
  require("dap").step_into()
end, { desc = "DAP step into" })

map("n", "<leader>dD", function()
  require("dap").terminate()
end, { desc = "DAP stop (terminate)" })

map("n", "<leader>dd", function()
  require("dap").disconnect()
end, { desc = "DAP stop (disconnect)" })

map("n", "<F11>", function()
  require("dap").step_out()
end, { desc = "DAP step out" })

map("n", "<F12>", function()
  require("dap").step_back()
end, { desc = "DAP step back" })

map("n", "<F2>", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP toggle breakpoint", noremap = true, silent = true })

--- FCITX
if vim.loop.os_uname().sysname == "Linux" or vim.loop.os_uname().sysname == "Unix" then
  map("i", "<C-f>", function()
    require("vdac.fcitx").toggleImname()
  end, { noremap = true, desc = "toggle fcitx" })
  vim.api.nvim_create_autocmd("InsertLeavePre", {
    pattern = "*",
    callback = function()
      local s = require "vdac.fcitx"
      if s.getFcitx() ~= "" then
        vim.fn.system(s.getFcitx() .. " -s " .. s.imname_us)
      end
    end,
  })
end

map("n", "<leader>td", "<cmd>TodoTelescope keywords=TODO,FIX<cr>", { noremap = true, silent = true })
map(
  "n",
  "<leader>tf",
  "<cmd>TodoTelescope keywords=HACK,WARN,TEST,IMPORTANT,ERROR,Deprecated<cr>",
  { noremap = true, silent = true }
)
map("n", "<leader>tn", "<cmd>TodoTelescope keywords=NOTE,INFO<cr>", { noremap = true, silent = true })
map("n", "<leader>ta", "<cmd>TodoTelescope<cr>", { noremap = true, silent = true })
map("n", "<leader>fc", function()
  require("telescope").extensions.dap.configurations {}
end, { noremap = true, silent = true, desc = "DAP configurations" })

map("v", "<leader>rs", ":vimgrep // %<Left><Left><Left>", { desc = "find in selection" })

map("n", "<leader>ts", function()
  local current_tabstop = vim.o.tabstop
  if current_tabstop == 8 then
    vim.o.tabstop = 4
    vim.o.shiftwidth = 4
    vim.o.softtabstop = 4
    print "Tabstop set to 4"
  else
    vim.o.tabstop = 8
    vim.o.shiftwidth = 8
    vim.o.softtabstop = 8
    print "Tabstop set to 8"
  end
end, { desc = "Toggle tabstop between 8 and 4" })

map("n", "*", "<cmd>keepjumps normal! mi*`i<CR>zz", { noremap = true, silent = true, desc = "highlight current word" })

map("n", "<leader>fr", "<cmd>Telescope registers<CR>", { noremap = true, silent = true, desc = "Telescope registers" })
