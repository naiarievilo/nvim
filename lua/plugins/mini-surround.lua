return {
  'echasnovski/mini.surround',
  version = '*',
  config = function()
    require('mini.surround').setup({
      mappings = {
        add = '<leader>Sa',
        delete = '<leader>Sd',
        find = '<leader>Sf',
        find_left = '<leader>SF',
        highlight = '<leader>Sh',
        replace = '<leader>Sr',
        update_n_lines = '<leader>Sn',
        suffix_last = 'h',
        suffix_next = 'l'
      },
    })
  end
}
