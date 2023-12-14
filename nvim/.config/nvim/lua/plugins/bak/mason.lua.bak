return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    lazy = true,
    event = "BufReadPre",
    config = function ()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "bashls",
                "tsserver",
                "pyright",
                "html",
                "rust_analyzer",
                "cssls",
                "lua_ls",
                "emmet_language_server",
                "jsonls",
            },

            automatic_installation = true,
        })
    end,
}
