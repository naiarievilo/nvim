-- Keybind helper
return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200
  end,
  config = function()
    require('which-key').setup({
      spelling = {
        suggestions = 24
      },
      window = {
        border = 'rounded',
      },
      layout = {
        spacing = 3,
      }
    })

    local which_key = require('which-key')
    which_key.register({
      s = { name = 'Search...' },
      h = { name = 'Harpoon...' },
      L = { name = 'LSP...' },
      l = { name = 'Leap...' }
    }, { prefix = '<leader>' })
  end
}
