-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<C-n>', ':Neotree toggle right<CR>', desc = 'NeoTree toggle', silent = true },
  },
  opts = {
    window = {
      position = 'left',
      width = 30,
    },
    filesystem = {
      filtered_items = { visible = true, hide_dotfiles = true, hide_gitignored = true, hide_hidden = true },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
