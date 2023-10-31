require('neo-tree').setup({
  popup_border_style = 'rounded',
  window = {
    position = 'float',
    width = 100
  },
})

vim.keymap.set({'n', 'v'}, '<C-n>', '<Cmd>Neotree toggle<CR>', { desc = 'Open Neo-tree'})

