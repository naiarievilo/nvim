require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
  },
})

