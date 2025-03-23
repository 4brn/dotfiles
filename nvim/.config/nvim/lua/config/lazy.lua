local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.uv.fs_stat(lazypath) then
  print 'Installing lazy.nvim....'
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
  print 'Done.'
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = {
    'tpope/vim-sleuth',
    { import = 'config.plugins' },
  },
  checker = {
    enabled = false,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
}
