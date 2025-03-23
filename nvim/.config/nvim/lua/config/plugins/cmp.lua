return {
  'saghen/blink.cmp',
  event = { 'BufReadPre', 'BufNewFile' },
  -- dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'mono',
    },

    completion = {
      menu = { scrollbar = false },
    },

    signature = { enabled = true },

    sources = {
      default = { 'lazydev', 'lsp', 'path' }, -- 'snippets', 'buffer'
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },
  },
}
