return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd', 'rustiwind' },
    },
    default_format_opts = { lsp_format = 'fallback' },
    format_on_save = { timeout_ms = 500 },
  },
}
