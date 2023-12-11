return {
    'windwp/nvim-ts-autotag',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    opts = {},
    config = function ()
        require('nvim-ts-autotag').setup()
   end,
}
