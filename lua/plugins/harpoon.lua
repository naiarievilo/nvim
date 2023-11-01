-- Quick file navigation
return {
  'ThePrimeagen/harpoon',
  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')
    vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = '[H]arpoon: [A]dd Current File' })
    vim.keymap.set('n', '<leader>hr', mark.rm_file, { desc = '[H]arpoon: [R]emove Current File' })
    vim.keymap.set('n', '<M-m>', ui.toggle_quick_menu, { desc = 'Harpoon [M]enu'})
    vim.keymap.set('n', '<M-1>', function() ui.nav_file(1) end, { desc = 'Go to Harpoon\'s saved file [1]' })
    vim.keymap.set('n', '<M-2>', function() ui.nav_file(2) end, { desc = 'Go to Harpoon\'s saved file [2]' })
    vim.keymap.set('n', '<M-3>', function() ui.nav_file(3) end, { desc = 'Go to Harpoon\'s saved file [3]' })
    vim.keymap.set('n', '<M-4>', function() ui.nav_file(4) end, { desc = 'Go to Harpoon\'s saved file [4]' })
  end
}
