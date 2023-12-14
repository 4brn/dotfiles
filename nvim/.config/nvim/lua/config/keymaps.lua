local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Lazy-nvim
keymap.set("n", "<leader>l", vim.cmd.Lazy)

-- ToggleTerm
-- keymap.set("n", "<leader>t", vim.cmd.ToggleTerm)

-- Format
vim.keymap.set({ "v", "n" }, "<leader>f", vim.lsp.buf.format, { remap = false })

-- Copy into host system clipboard with <leader>y
-- keymap.set('v', '<leader>y', '"*y', opts)

-- Remaps to delete/cut to system clipboard
-- keymap.set("n", "<leader>d", "\"_d", { desc = "Delete/Cut to system clipboard" })

-- Allows pasting over selection without losing the copied text
keymap.set("v", "<leader>p", "\"_dP", opts)

-- Indent and outdent lines in visual mode
keymap.set('v', '>', '<S->>gv', opts)
keymap.set('v', '<', '<S-<>gv', opts)
-- Indent and outdent lines quickly
keymap.set('n', '>', '>>', opts)
keymap.set('n', '<', '<<', opts)

-- Comments
vim.api.nvim_set_keymap("n", "<C-/>", "gcc", {silent = true})
vim.api.nvim_set_keymap("v", "<C-/>", "gcc", {silent = true})

-- Redo
keymap.set('n', "U", "<C-r>", opts)

-- Pane Navigaion
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)  -- Split Vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontally
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Split Horizontally

-- Allows the selected text to move, while in Visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeps curosr stationary when appendit the line below
keymap.set("n", "J", "mzJ`z", opts)

-- Keeps the cursor in the middle when searching with /
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- Saves the changes of vertial editing when exiting with Ctrl + c
keymap.set("i", "<C-c>", "<Esc>", opts)

-- Do not press Q
keymap.set("n", "Q", "<nop>", opts)
