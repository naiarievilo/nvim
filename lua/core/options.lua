-- See `:help vim.o` and `:help vim.opt` and related scoped options

-- COMMAND PROMPT
vim.o.cmdheight = 0

-- COMPLETION
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- CURSOR
vim.o.mouse = 'a'
vim.opt.guicursor = {
  'n-v-c:block',
  'i-ci-ve:ver25',
  'r-cr:hor20',
  'o:hor50',
  'a:blinkwait1000-blinkoff500-blinkon500-Cursor/lCursor',
  'sm:block-blinkwait100-blinkfoff150-blinkon150',
}
vim.o.mousemev = true

-- FILE HISTORY
-- Save undo history
vim.o.undofile = true

-- INDENTATION
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.o.breakindent = true
vim.opt.expandtab = true

-- LINE BREAK
vim.o.linebreak = true

-- LINE NUMBERS
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cursorline = true

-- TERMINAL COLORS
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- RULERS
vim.o.colorcolumn = "81"

-- SCROLLING
vim.o.scrolloff = 10

-- SEARCH
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- SIGNCOLUMN
-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- TABLINE
vim.o.showtabline = 0

-- UPDATE
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 100
vim.o.ttimeoutlen = 10
