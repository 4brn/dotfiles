return {
    -- Main LSP Configuration
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {},
        },
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("grn", vim.lsp.buf.rename, "Rename")
                map("ga", vim.lsp.buf.code_action, "Goto Code Action", { "n", "x" })
                map("gD", vim.lsp.buf.declaration, "Goto Declaration")
                map("gd", vim.lsp.buf.definition, "Goto Definition")
            end,
        })

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        local servers = {
            clangd = {},
            -- pyright = {},
            -- rust_analyzer = {},
            -- ts_ls = {},
        }

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            "lua-language-server", -- Lua Language server
            "stylua", -- Used to format Lua code
        })

        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        for name, server in pairs(servers) do
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            vim.lsp.config(name, server)
            vim.lsp.enable(name)
        end

        -- Special Lua Config, as recommended by neovim help docs
        vim.lsp.config("lua_ls", {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if path ~= vim.fn.stdpath("config") and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc")) then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    runtime = {
                        version = "LuaJIT",
                        path = { "lua/?.lua", "lua/?/init.lua" },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                })
            end,
            settings = {
                Lua = {},
            },
        })
        vim.lsp.enable("lua_ls")
    end,
}
