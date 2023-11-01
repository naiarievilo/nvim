vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('core.autocmds')
require('core.keymaps')
require('core.options')

require('lazy').setup('plugins', {
  install = {
    colorscheme = { 'catppuccin' }
  },
  ui = {
    border = 'rounded',
    title = ' Lazy Plugin Manager '
  },
})
