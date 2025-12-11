
-- Increment/Decrement
-- set("n", "+", "<C-a>")
-- set("n", "-", "<C-x>")

-- Split windows
vim.keymap.set("n", "<space>sh", ":split<Return>", {noremap = true, silent = true, desc = "Horizontal"})
vim.keymap.set("n", "<space>sv", ":vsplit<Return>", {noremap = true, silent = true, desc = "Vertical"})

-- Move Window
vim.keymap.set("n", "<C-h>", "<C-w>h", {noremap = true, silent = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {noremap = true, silent = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {noremap = true, silent = true})
vim.keymap.set("n", "<C-k>", "<C-w>k", {noremap = true, silent = true})

vim.keymap.set("n", "Q", "<nop>", {noremap = true, silent = true}) -- Nuke shift+q keymap
vim.keymap.set({ "n", "v" }, "<Space>", "<nop>", {noremap = true, silent = true})

-- Clear highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {noremap = true, silent = true})

-- Undo
vim.keymap.set("n", "U", "<C-r>", {noremap = true, silent = true, desc = "Undo"})

-- Oil
vim.keymap.set("n", "-", ":Oil<CR>", {noremap = true, silent = true, desc = "Oil"})

-- Quickfix list
vim.keymap.set("n", "<M-j>", ":cnext<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<M-k>", ":cprevious<CR>", {noremap = true, silent = true})

-- Move selected lines with shift+j or shift+k
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {noremap = true, silent = true})

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {noremap = true, silent = true})

-- Ctrl-V visual editing
vim.keymap.set("i", "<C-c>", "<Esc>", {noremap = true, silent = true})

-- Center highlight on screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", {noremap = true, silent = true})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {noremap = true, silent = true})
vim.keymap.set("n", "n", "nzzzv", {noremap = true, silent = true})
vim.keymap.set("n", "N", "Nzzzv", {noremap = true, silent = true})

-- Function to reindent and preserve cursor position
local function reindent()
  local line = vim.fn.line('.')  -- Save current line number
  vim.cmd('%s/\\s\\+$//e')        -- Remove trailing whitespace
  vim.cmd('normal! gg=G')        -- Reindent entire buffer
  vim.fn.cursor(line, 1)         -- Move back to the original line
end

-- Auto-command to call the function before saving
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = reindent,
})


-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
