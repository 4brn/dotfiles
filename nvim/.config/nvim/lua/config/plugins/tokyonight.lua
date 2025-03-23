return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        terminal_colors = true
      })

      vim.cmd.colorscheme "tokyonight"
    end
  }
}
