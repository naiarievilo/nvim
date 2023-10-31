require('which-key').setup({
  spelling = {
    suggestions = 24
  },
  window = {
    border = 'rounded'
  },
})

local which_key = require('which-key')
which_key.register({
  s = { name = 'Search'},
  h = { name = 'Harpoon'},
  l = { name = 'LSP'}
}, { prefix = '<leader>' })
