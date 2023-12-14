return{
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("oil").setup({
            vim.keymap.set("n", "<leader>e", require("oil").open),

            default_file_explorer = true,

            -- Skip the confirmation popup for simple operations
            skip_confirm_for_simple_edits = true,

            -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
            prompt_save_on_select_new_entry = true,

            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = "actions.select_vsplit",
                -- ["<C-h>"] = "actions.select_split",
                -- ["<C-t>"] = "actions.select_tab",
                -- ["<C-p>"] = "actions.preview",
                ["<leader>e"] = "actions.close", -- <C-c>
                -- ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
            },
            -- Set to false to disable all of the above keymaps
            use_default_keymaps = true,

            view_options = {
                show_hidden = true,
            },

        })
    end
}
