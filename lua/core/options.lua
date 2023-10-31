-- See `:help vim.o` and `:help vim.opt` and related scoped options

-- INDENTATION
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.o.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2


-- SEARCH
-- Search hilighting
vim.o.hlsearch = false
vim.o.incsearch = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true


-- LINE NUMBERS
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cursorline = true


-- CURSORS
vim.o.mouse = 'a'
vim.opt.guicursor = {
  'n-v-c:block',
  'i-ci-ve:ver25',
  'r-cr:hor20',
  'o:hor50',
  'a:blinkwait1000-blinkoff500-blinkon500-Cursor/lCursor',
  'sm:block-blinkwait100-blinkfoff150-blinkon150',
}


-- CLIPBOARD
-- Sync clipboard between OS and nvim
--  Remove it to keep the OS' clipboard independent from nvim
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'


-- FILE HISTORY
-- Save undo history
vim.o.undofile = true


-- SIGNCOLUMN
-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- UPDATE
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300


-- COMPLETION
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


-- TERMINAL COLORS
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true


-- SCROLLING
-- Set top and bottom minimum lines while scrolling
vim.o.scrolloff = 10


-- RULERS
vim.o.colorcolumn = "81"


-- COMMAND PROMPT
vim.o.cmdheight = 0

