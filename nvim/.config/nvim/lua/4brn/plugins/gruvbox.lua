return {
  "ellisonleao/gruvbox.nvim",
  enabled = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      terminal_colors = true, -- add neovim terminal colors
      bold = false,
      italic = {
        strings = false,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
    })
    vim.cmd("colorscheme gruvbox")
  end,
}
