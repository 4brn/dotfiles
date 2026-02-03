return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  config = function()
    local harpoon = require("harpoon")
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {silent = true, noremap = true, desc = "Add to Harpoon"})
    vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,{silent = true, noremap = true, desc = "Harpoon"})

    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end, {silent = true, noremap = true})
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end, {silent = true, noremap = true})
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end, {silent = true, noremap = true})
    vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end, {silent = true, noremap = true})

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-H>", function() harpoon:list():prev() end, {silent = true, noremap = true})
    vim.keymap.set("n", "<C-S-L>", function() harpoon:list():next() end, {silent = true, noremap = true})
  end,
}
