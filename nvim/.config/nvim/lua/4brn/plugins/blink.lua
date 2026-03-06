return {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    opts = {
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = "default" },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            menu = { auto_show = false },
            documentation = { auto_show = false },
        },

        -- function parameter signarures
        signature = {
            enabled = false,
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
