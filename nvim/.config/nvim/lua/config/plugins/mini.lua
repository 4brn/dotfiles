return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.icons').setup()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()
    require('mini.statusline').setup()
    require('mini.pairs').setup()
  end,
}
