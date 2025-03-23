return {
  'rose-pine/neovim',
  enabled = true,
  priority = 1000,
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup {
      styles = {
        bold = true,
        italic = false,
        transparency = true,
      },
    }
    vim.cmd.colorscheme 'rose-pine'
  end,

  lazy = false,
}
