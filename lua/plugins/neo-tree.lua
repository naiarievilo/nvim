return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup({
      popup_border_style = 'rounded',
      window = {
        position = 'float',
        width = 100
      },
    })

    vim.keymap.set( {'n', 'v'}, '<C-n>', '<Cmd>Neotree toggle<CR>', { desc = 'Open Neo-tree'})
  end
}
