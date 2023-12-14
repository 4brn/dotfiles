return {
    "nvim-treesitter/nvim-treesitter",
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'TSInstallInfo', 'TSInstall' },
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            auto_install = true,

            highlight = {
                -- `false` will disable the whole extension
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
