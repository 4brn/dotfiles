local keymap = vim.keymap

return {
    "nvim-telescope/telescope.nvim",
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require('telescope.builtin')

        keymap.set('n', '<leader>fk', builtin.keymaps)
        keymap.set('n', '<leader>fh', builtin.help_tags)
        keymap.set('n', '<leader>ff', builtin.find_files)
        keymap.set('n', '<leader>fg', builtin.live_grep)
        keymap.set('n', '<leader>fb', builtin.buffers)

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<TAB>"] = "move_selection_next",
                        ["<S-TAB>"] = "move_selection_previous",
                    },
                },
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.5,
                        results_width = 0.5,
                    },
                    vertical = {
                        mirror = true,
                    },
                    width = 0.9,
                    height = 0.9,
                    preview_cutoff = 120,
                },
                sorting_strategy = "ascending",
                borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                color_devicons = true,
                set_env = { ["COLORTERM"] = "truecolor" },
            },
            pickers = {
                find_files = {
                    previewer = true,
                    hidden = false,
                },
                live_grep = {
                    previewer = true,
                },
                buffers = {
                    previewer = true,
                },
            },
        })

        telescope.load_extension("fzf")
    end,
}
