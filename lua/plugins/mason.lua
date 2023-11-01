return {
  'williamboman/mason.nvim',
  config = function()
    require('mason').setup({
      ui = {
        border = 'rounded',
        height = 0.8
      }
    })
  end
}
