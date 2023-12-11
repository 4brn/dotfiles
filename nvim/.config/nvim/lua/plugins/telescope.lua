local keymap = vim.keymap

local config = function()
    local telescope = require("telescope")
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
            },
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.5,
                    results_width = 0.5,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.9,
                height = 0.9,
                preview_cutoff = 120,
            },
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            path_display = { "truncate" },
            winblend = 0,
            border = {},
            borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└"},
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" },
        },
        pickers = {
            find_files = {
                -- theme = "dropdown",
                previewer = true,
                hidden = true,
            },
            live_grep = {
                -- theme = "dropdown",
                previewer = true,
            },
            buffers = {
                -- theme = "dropdown",
                previewer = true,
            },
        },
    })

    telescope.load_extension("fzf")
end

return {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = config,
    keys = {
        keymap.set('n', '<leader>fk', ":Telescope keymaps<CR>", {desc = "Find Keymaps"}),
        keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>", {desc = "Find Help Tags"}),
        keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", {desc = "Find Files"}),
        -- keymap.set('n', '<leader>fa', ":Telescope <CR>", {desc = "Telescope"}),
        keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", {desc = "Live Grep"}),
        keymap.set('n', '<leader>fb', ":Telescope buffers<CR>", {desc = "Find Buffers"}),
    },
}
