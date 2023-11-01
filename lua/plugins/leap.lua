return {
  'ggandor/leap.nvim',
  dependencies = {
    'tpope/vim-repeat'
  },
  config = function()
    local leap = require('leap')

    leap.opts.case_sensitive = true

    vim.keymap.set({ 'n', 'x', 'o' }, '<leader>lf', '<Plug>(leap-forward-to)', { desc = 'Leap: jump forward to' })
    vim.keymap.set({ 'n', 'x', 'o' }, '<leader>lF', '<Plug>(leap-backward-to)', { desc = 'Leap: jump backward to' })
    vim.keymap.set({ 'v', 'o' }, '<leader>lu', '<Plug>(leap-forward-till)', { desc = 'Leap: jump forward until' })
    vim.keymap.set({ 'v', 'o' }, '<leader>lU', '<Plug>(leap-backward-till)', { desc = 'Leap: jump backward until' })
  end
}
