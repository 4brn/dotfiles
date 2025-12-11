return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    sync_install = false,
    ensure_installed = { "c", "lua", "javascript", "typescript", "bash", "vim", "vimdoc",  "markdown", "markdown_inline", },
    sync_install = false,
    auto_install = true,
    indent = {
      enable = true
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "markdown" },
    },
  },
}
