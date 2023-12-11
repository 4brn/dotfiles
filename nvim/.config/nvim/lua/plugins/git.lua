return {
	{
		"tpope/vim-fugitive",
        lazy = false,
        opts = {},
		config = function ()
            vim.keymap.set("n", "<leader>g", vim.cmd.Git, { desc = "Git/Figitive" })
		end
	}
    -- {
    -- 	"lewis6991/gitsigns.nvim",
    -- 	opts = {},
    -- },
    -- {
    -- 	"akinsho/git-conflict.nvim",
    -- 	commit = "2957f74",
    -- 	config = function()
    -- 		require("git-conflict").setup({
    -- 			default_mappings = {
    -- 				ours = "co",
    -- 				theirs = "ct",
    -- 				none = "c0",
    -- 				both = "cb",
    -- 				next = "cn",
    -- 				prev = "cp",
    -- 			},
    -- 		})
    -- 	end,
    -- },
}
