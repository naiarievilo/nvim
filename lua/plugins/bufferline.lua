return {
  'akinsho/bufferline.nvim',
  version = '*',
  config = function()
    local bufferline = require('bufferline')

    bufferline.setup({
      options = {
        mode = 'tabs',
        enforce_regular_tabs = true,
        always_show_bufferline = false
      }
    })
  end
}
