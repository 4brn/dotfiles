return {
  'nvim-mini/mini.diff',
  opts = {
    view = {
      style = "sign",
      signs = {
        add = "▎",
        change = "▎",
        delete = "▎",
      },
    },
    mappings = {
      -- Apply hunks inside a visual/operator region
      apply = '',

      -- Reset hunks inside a visual/operator region
      reset = '',

      -- Hunk range textobject to be used inside operator
      -- Works also in Visual mode if mapping differs from apply and reset
      textobject = '',

      -- Go to hunk range in corresponding direction
      goto_first = '[H',
      goto_prev = '[h',
      goto_next = ']h',
      goto_last = ']H',
    },
  },
}
