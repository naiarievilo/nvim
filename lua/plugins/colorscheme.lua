return {
  'catppuccin/nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('catppuccin').setup({
      flavour = 'macchiato',
      no_italic = true,
      term_colors = true,
      integrations = {
        harpoon = true,
        mason = true,
        neotree = true
      }
    })

    vim.cmd 'colorscheme catppuccin'
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { italic = true, fg = '#f9e2af' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { italic = true, fg = '#f38ba8' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { italic = true, fg = '#94e2d5' })
    vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { italic = true, fg = '#89dceb' })
  end
}

