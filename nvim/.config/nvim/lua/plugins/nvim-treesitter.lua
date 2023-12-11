local config = function()
    require("nvim-treesitter.configs").setup({
        build = ":TSUpdate",
        indent = { enable = true },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
        },
        autotag = {
            enable = true,
        },
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        ensure_installed = {
            "json",
            "javascript",
            "typescript",
            "java",
            "c",
            "cpp",
            "html",
            "css",
            "bash",
            "lua",
            "python",
            "jsdoc",
            "luadoc",
            "markdown",
            "query",
            "vim",
            "vimdoc",
            "regex",
            "toml",
        },
        auto_install = true,
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = config,
}

