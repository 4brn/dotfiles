return {
    {
        'iamcco/markdown-preview.nvim',
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = 'cd app && npm install',
        -- using npm to install rather than the vim function leads to significantly faster startup time
        init = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        ft = { "markdown" },
        config = function()
            vim.keymap.set('n', '<leader>md', '<Plug>MarkdownPreviewToggle')
        end,
    },
}
