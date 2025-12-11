return {
  "folke/zen-mode.nvim",
  opts = {},
  config = function()
    require("zen-mode").setup({
      window = {
        width = 0.80,
        options = {
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          laststatus = 0, -- turn off the statusline in zen mode
        },
      }
    })

    vim.keymap.set("n", "<leader>zz", ":ZenMode<CR>", {noremap = true, silent = true, desc = "Zen"})
  end,
}
