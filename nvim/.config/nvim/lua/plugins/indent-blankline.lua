return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "lazy",
        "mason",
      },
    },
  },main = "ibl",
}
