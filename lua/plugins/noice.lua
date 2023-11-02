return {
  'folke/noice.nvim',
  dependencies = {
    'MunifTanjin/nui.nvim',
    'rcarriga/nvim-notify'
  },
  event = 'VeryLazy',
  opts = {},
  config = function()
    require('noice').setup({
      cmdline = {
        enabled = true,
        view = 'cmdline'
      }
    })
  end
}
