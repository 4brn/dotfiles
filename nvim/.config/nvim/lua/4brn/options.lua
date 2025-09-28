vim.g.mapleader = " "

-- UI: Line Numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- UI: Text display
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.termguicolors = true
vim.o.background = "dark"

-- Editing: Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true

-- Editing: Auto-formatting
vim.opt.smartindent = true
vim.opt.autoindent = false
vim.opt.breakindent = true
vim.opt.formatoptions:append({ "r" })

-- Editing: Input behavior
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.mouse = ""

-- Search and replace
vim.o.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- File operations
vim.opt.backup = false
vim.opt.undofile = true

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

-- Special characters
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- System integration
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
