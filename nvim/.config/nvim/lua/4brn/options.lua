vim.g.mapleader = " "

-- System integration
vim.opt.clipboard:append("unnamedplus")

-- UI: Line Numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- UI: Text display
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.termguicolors = true
vim.o.background = "dark"

-- Diagnostics
vim.diagnostic.enable(false)
vim.diagnostic.config({ virtual_text = false })

vim.opt.winborder = "rounded"
vim.opt.colorcolumn = "80"
-- vim.opt.showmode = false
vim.opt.winblend = 0
vim.opt.autoread = true
vim.opt.iskeyword:append("-")
vim.opt.cursorline = false
vim.opt.guicursor = ""

-- Editing: Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true

-- Editing: Auto-formatting
vim.opt.smartindent = true
vim.opt.autoindent = false
vim.opt.breakindent = true
vim.opt.formatoptions:append({ "r" })

-- Editing: Input behavior
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.mouse = "a"

-- Search and replace
vim.o.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- File operations
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.swapfile = false

-- File navigation
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Split windows
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "cursor"

-- Performance
vim.opt.updatetime = 50
vim.opt.timeoutlen = 250
