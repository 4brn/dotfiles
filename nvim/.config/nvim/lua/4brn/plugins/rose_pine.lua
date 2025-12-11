return {
  "rose-pine/neovim",
  priority = 1000,
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      styles = {
        bold = true,
        italic = false,
        transparency = true,
      },
    })
    vim.cmd.colorscheme("rose-pine")

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
  end,

  lazy = false,
}
