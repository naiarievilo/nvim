return {
  'catppuccin/nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = 'macchiato',
      no_italic = true,
      term_colors = true,
      integrations = {
        cmp = true,
        dap = {
          enabled = true,
          enabled_ui = true
        },
        gitsigns = true,
        harpoon = true,
        indent_blankline = true,
        leap = true,
        lsp_trouble = true,
        mason = true,
        neotree = true,
        noice = true,
        telescope = {
          enabled = true,
        },
        treesitter = true,
        which_key = true
      }
    })

    vim.cmd 'colorscheme catppuccin'
  end
}
