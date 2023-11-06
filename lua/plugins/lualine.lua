-- Statusline
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          {
            'branch',
            separator = ''
          },
          {
            'diff',
            symbols = {
              added = '',
              modified = '󰜥',
              removed = '󰍴'
            },
          },
          {
            'diagnostics',
            sources = { 'nvim_lsp', 'nvim_diagnostic' },
            sections = { 'error', 'warn', 'info', 'hint' },
            symbols = {
              error = ' ',
              warn = ' ',
              info = ' ',
              hint = ' '
            },
          }
        },
        lualine_c = {
          {
            'filename',
            path = 1,
          },
        }
      },
      extensions = {
        'fugitive',
        'fzf',
        'lazy',
        'mason',
        'neo-tree',
        'nvim-dap-ui',
        'toggleterm'
      }
    })
  end
}
