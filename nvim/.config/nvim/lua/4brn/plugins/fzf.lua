return {
  "ibhagwan/fzf-lua",
  enabled = true,
  opts = {},
  config = function()
    require("fzf-lua").setup({
      winopts = {
        fullscreen = true,
        preview = {
          layout = "vertical",
          vertical = "up:60%",
        }
      },
      files = {
        hidden = false,
        fzf_opts = {
          -- ['--exact'] = "",
          -- ['--no-sort'] = "",
        }
      }
    })

    local keymap = vim.keymap
    local fzf = require("fzf-lua")
    keymap.set("n", "<space>fr", fzf.resume, { noremap = true, silent = true, desc = "Resume" })
    keymap.set("n", "<leader>fg", fzf.grep, { noremap = true, silent = true, desc = "Grep" })
    keymap.set("n", "<leader>f/", fzf.live_grep, { noremap = true, silent = true, desc = "Live Grep" })
    keymap.set("n", "<leader>ff", fzf.files, { noremap = true, silent = true, desc = "Files" })
    keymap.set("n", "<leader>fn", function()
      fzf.files({ cwd = vim.fn.stdpath("config") })
    end, { noremap = true, silent = true, desc = "Neovim Config" })
    keymap.set("n", "<leader>f?", fzf.files, { noremap = true, silent = true, desc = "Everything" })
  end,
}
