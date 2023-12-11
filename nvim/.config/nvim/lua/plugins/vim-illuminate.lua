return {
    "RRethy/vim-illuminate",
    lazy = false,
    opts = {
        delay = 100,
        large_file_cutoff = 2000,
        large_file_overrides = {
            providers = { "lsp" },
        },
    },
    config = function()
        require('illuminate').configure({})
    end
}
