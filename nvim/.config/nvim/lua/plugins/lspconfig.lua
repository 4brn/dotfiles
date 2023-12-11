return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- {
        --     "j-hui/fidget.nvim",
        --     tag = "legacy",
        --     event = "LspAttach",
        -- },
        "folke/neodev.nvim",
        "RRethy/vim-illuminate",
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        local keymap = vim.keymap -- for conciseness

        -- Neodev setup
        require("neodev").setup()

        local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Diagnostic config
        local config = {
            virtual_text = false,
            signs = {
                active = signs,
            },
            update_in_insert = true,
            underline = true,
            severity_sort = true,
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        }
        vim.diagnostic.config(config)


        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local on_attach = function(_, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }
            keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
            keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { { desc = "Code action" }, opts })
            keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)

            keymap.set('n', 'gD', vim.lsp.buf.declaration, { { desc = "Go to Declaration" }, opts })
            keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            keymap.set('n', 'K', vim.lsp.buf.hover, { { desc = "Hover" }, opts })
            keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
            keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_nvim_lsp.default_capabilities()

        -- Lua
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure typescript server
        lspconfig["tsserver"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            init_options = {
                preferences = {
                    disableSuggestions = true,
                }
            }
        })

        -- CSS
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Emmet
        lspconfig["emmet_language_server"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })

        -- Python
        -- lspconfig["pyright"].setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        -- })

        -- Bash
        lspconfig["bashls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Json
        lspconfig["jsonls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Rust
        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Python
        lspconfig["pylsp"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                pylsp = {
                    plugins = {
                        flake8 = {
                            enabled = true,
                            maxLineLength = 88, -- Black's line length
                        },
                        -- Disable plugins overlapping with flake8
                        pycodestyle = {
                            enabled = false,
                        },
                        mccabe = {
                            enabled = false,
                        },
                        pyflakes = {
                            enabled = false,
                        },
                        -- Use Black as the formatter
                        autopep8 = {
                            enabled = false,
                        },
                    },
                },
            },
        })
    end,
}
