return {
  'folke/trouble.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    local trouble = require('trouble')
    trouble.setup({})

    vim.keymap.set(
      'n', '<leader>ta', function() trouble.toggle() end,
      { desc = 'All diagnostics' }
    )
    vim.keymap.set(
      'n', '<leader>tw', function() trouble.toggle('workspace_diagnostics') end,
      { desc = 'Workspace diagnostics' }
    )
    vim.keymap.set(
      'n', '<leader>td', function() trouble.toggle('document_diagnostics') end,
      { desc = 'Document diagnostics' }
    )
    vim.keymap.set(
      'n', '<leader>tq', function() trouble.toggle('quickfix') end,
      { desc = 'Quickfix diagnostics' }
    )
    vim.keymap.set(
      'n', '<leader>tl', function() trouble.toggle('loclist') end,
      { desc = 'Location list diagnostics' }
    )
    vim.keymap.set(
      'n', '<leader>tL', function() trouble.toggle('lsp_references') end,
      { desc = 'LSP references' }
    )
    vim.keymap.set(
      'n', '<leader>tn',
      function() trouble.next({ skip_groups = false, jump = true }) end,
      { desc = 'Jump to next diagnostic' }
    )
    vim.keymap.set(
      'n', '<leader>tN',
      function() trouble.previous({ skip_groups = false, jump = true }) end,
      { desc = 'Jump to previous diagnostic' }
    )
  end
}
