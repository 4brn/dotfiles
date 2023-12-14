return {
    "nvim-lualine/lualine.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                globalstatus = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {'branch', 'diff', 'diagnostics'}, -- 'branch', 'diff', 'diagnostics'
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        })
    end,
}
