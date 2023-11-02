-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Keep cursor centralized when scrolling and searching
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Keep yanked text on unnamed register
vim.keymap.set('x', '<leader>p', '\"_dP')

-- Make CTRL-C have same effect as Esc and CTRL-[
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Deal with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Delete current buffer quickly
vim.keymap.set('n', '<leader>-', function() vim.cmd 'bd!' end, { desc = 'Delete current buffer' })

-- Quick type rename
vim.keymap.set({ 'n', 'v' }, '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Rename current word' })
