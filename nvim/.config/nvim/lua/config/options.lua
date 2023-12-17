-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ' '
g.maplocalleader = ' '
opt.mouse = ''                        -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
opt.encoding = "utf-8"

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true           -- Show line number
opt.relativenumber = true   -- Show relative line number
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.scrolloff = 8
opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.signcolumn = 'yes'
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.laststatus=3            -- Set global statusline

-----------------------------------------------------------
-- Search
-----------------------------------------------------------
opt.incsearch = true
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.hlsearch = false

-----------------------------------------------------------
-- Cursor
-----------------------------------------------------------
opt.guicursor = {
    'n-v-c:block-Cursor',
    'i-ci:block-Cursor',
    'r:hor50-Cursor'
}

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.tabstop = 4             -- 1 tab == 4 spaces
opt.shiftwidth = 4          -- Shift 4 spaces when tab
-- opt.softtapstop = 4
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftround = true
opt.expandtab = true
opt.wrap = false            -- Wrap Text
opt.smartindent = true      -- Autoindent new lines

-----------------------------------------------------------
-- Undo
-----------------------------------------------------------
opt.swapfile = false                  -- Don't use swapfile
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 50         -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "sI"

-- -- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   -- "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
