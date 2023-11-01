-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Keep cursor centralized when scrolling and searching
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Keep yanked text on unnamed register
vim.keymap.set('x', '<leader>p', '\"_dP')

-- Delete last word when in insert mode
vim.keymap.set('i', '<M-BS>', '<C-[>ldbi')

-- Make CTRL-C have same effect as Esc and CTRL-[
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Deal with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Diagnostic messages
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Delete current buffer quickly
vim.keymap.set('n', '<leader>-', function() vim.cmd 'bd!' end, { desc = 'Delete current buffer' })
