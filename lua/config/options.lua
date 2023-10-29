-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set tab and shiftwidth configs
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Set highlight on search and incremental search
vim.o.hlsearch = false
vim.o.incsearch = true

-- Make relative line numbers default and highlight current line number
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cursorline = true

-- Enable mouse mode and set cursor width
vim.o.mouse = 'a'
vim.opt.guicursor = {
  'n-v-c:block',
  'i-ci-ve:ver25',
  'r-cr:hor20',
  'o:hor50',
  'a:blinkwait1000-blinkoff500-blinkon500-Cursor/lCursor',
  'sm:block-blinkwait100-blinkfoff150-blinkon150',
}

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Set top and bottom minimum lines while scrolling
vim.o.scrolloff = 8

-- Set max text width per line and rule
vim.o.colorcolumn = "81"
