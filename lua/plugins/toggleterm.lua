return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({
      open_mapping = [[<C-\>]],
      direction = 'float',
      highlights = {
        FloatBorder = {
          guifg = '#8CAAEE'
        }
      },
      float_opts = {
        border = 'curved',
      }
    })
  end
}
