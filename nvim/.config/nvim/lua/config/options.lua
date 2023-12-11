local opt = vim.opt

-- see ":set all" for all available options.
-- see ":options"

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Cursor
opt.guicursor = {
    'n-v-c:block-Cursor',
    'i-ci:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
    'r:hor50-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100'
}

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.completeopt = "menuone,noinsert,noselect"

-- Tabs and indentaion
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.wrap = false
opt.smartindent = true

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Behaviour
opt.hidden = true
opt.errorbells = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append('a')
opt.modifiable = true
opt.encoding = "UTF-8"
opt.updatetime = 50

-- Undo
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true

-- Clipboard
opt.clipboard = 'unnamedplus'
