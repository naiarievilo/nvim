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

    -- Buffer-agnostic groups
    local wk = require('which-key')
    wk.register({
      D = { name = 'Diagnostics...' },
      h = { name = 'Harpoon...' },
      l = { name = 'Leap...' },
      s = { name = 'Search...' },
      t = { name = 'Trouble...' }
    }, { prefix = '<leader>' })
  end
}
