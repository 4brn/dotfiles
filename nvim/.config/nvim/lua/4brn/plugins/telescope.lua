return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        wrap_result = true,
        mappings = {
          i = { ["<esc>"] = require("telescope.actions").close },
        },
      },
      pickers = {
        builtin = { theme = "dropdown", previewer = false },
        treesitter = { theme = "dropdown", previewer = false },
      },
    })

    local keymap = vim.keymap
    local builtin = require("telescope.builtin")
    keymap.set("n", "<space>fr", builtin.resume, { desc = "resume" })

    keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "grep" })
    keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "word" })

    keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "diagnostics" })
    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "files" })
    keymap.set("n", "<leader>fF", builtin.git_files, { desc = "git" })
    keymap.set("n", "<leader>fp", builtin.builtin, { desc = "pickers" })

    keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help" })
    keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "man" })
    keymap.set("n", "<leader>fo", builtin.vim_options, { desc = "options" })
    keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "keymaps" })
    keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "buffers" })

    keymap.set("n", "<leader>fn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "neovim" })

    pcall(require("telescope").load_extension, "fzf")
  end,
}
