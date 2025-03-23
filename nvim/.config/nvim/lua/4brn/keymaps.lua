local set = function(mode, key, cmd, desc)
  local opts = { noremap = true, silent = true }
  if not desc == nil then
    opts.desc = desc
  end
  vim.keymap.set(mode, key, cmd, opts)
end

--- keymap.set('n', 'x', '_x', opts)

-- Increment/Decrement
set('n', '+', '<C-a>')
set('n', '-', '<C-x>')

-- -- Split windows
set('n', 'ss', ':split<Return>')
set('n', 'sv', ':vsplit<Return>')

-- Move Window
set('n', '<C-h>', '<C-w>h')
set('n', '<C-l>', '<C-w>l')
set('n', '<C-j>', '<C-w>j')
set('n', '<C-k>', '<C-w>k')

-- Nuke shift+q keymap
set('n', 'Q', '<nop>')
set({ 'n', 'v' }, '<Space>', '<nop>')

-- Lua execution
set('n', '<space>lf', '<cmd>source %<Return>', 'file')
set('n', '<space>lx', ':.lua<Return>', 'line')
set('v', '<space>lx', ':.lua<Return>', 'selection')

-- Clear highlights
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Undo
set('n', 'U', '<C-r>', 'undo')

-- Oil
set('n', '-', ':Oil<CR>', 'oil')

-- Quickfix list
set('n', '<M-j>', ':cnext<CR>', 'next')
set('n', '<M-k>', ':cprevious<CR>', 'prev')

-- Move selected lines with shift+j or shift+k
set('v', 'J', ":m '>+1<CR>gv=gv")
set('v', 'K', ":m '<-2<CR>gv=gv")

-- Terminal
set('t', '<Esc><Esc>', '<C-\\><C-n>', 'exit')

-- Ctrl-V visual editing
set('i', '<C-c>', '<Esc>')

-- Center highlight on screen
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
