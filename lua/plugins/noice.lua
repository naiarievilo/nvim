return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {},
  config = function()
    require('noice').setup({
      cmdline = {
        enabled = true,
        view = 'cmdline'
      },
      lsp = {
        -- Override markdown rendering so nvim-cmp and other plugins use Treesitter
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    })
  end
}
