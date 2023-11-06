return {
  'kdheepak/lazygit.nvim',
  config = function()
    vim.keymap.set('n', '<leader>gl', function() vim.cmd 'LazyGit' end, { desc = 'Open LazyGit' })
  end
}
