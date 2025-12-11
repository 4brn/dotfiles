return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      width = .80,
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
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
  },
  config = function()
    vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", {noremap = true, silent = true, desc = "Zen"})
  end,
}
