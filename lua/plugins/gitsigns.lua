return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      signs = {
        add = { text = '' },
        change = { text = '󰜥' },
        delete = { text = '󰍴' },
        topdelete = { text = '󰍴' },
        changedelete = { text = '󰜥' },
        untracked = { text = '╎' }
      },
      preview_config = {
        border = 'rounded',
      },
      on_attach = function(bufnr)
        vim.keymap.set(
          'n',
          '<leader>gp',
          require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = 'Preview Git hunks' }
        )

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, '<leader>gn', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })

        vim.keymap.set({ 'n', 'v' }, '<leader>gN', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })

        local wk = require('which-key')
        wk.register({
          g = { name = 'Git...' }
        }, { prefix = '<leader>', buffer = bufnr })
      end
    })
  end
}
