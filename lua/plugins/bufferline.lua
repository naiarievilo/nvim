return {
  'akinsho/bufferline.nvim',
  version = '*',
  config = function()
    local bufferline = require('bufferline')
    local macchiato = require('catppuccin.palettes').get_palette('macchiato')

    bufferline.setup({
      highlights = require('catppuccin.groups.integrations.bufferline').get({}),
      options = {
        mode = 'tabs',
        enforce_regular_tabs = true,
        always_show_bufferline = false
      }
    })
  end
}
