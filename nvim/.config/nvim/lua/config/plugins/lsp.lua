return {
  {
    'neovim/nvim-lspconfig',
    -- cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    -- event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
      { 'j-hui/fidget.nvim', opts = {} },
    },

    config = function()
      vim.keymap.set('n', '<leader>cq', vim.diagnostic.setqflist, { desc = 'diagnostics' })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

      local format = function()
        vim.lsp.buf.format { async = false, timeout_ms = 10000 }
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local builtin = require 'telescope.builtin'

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if not client then
            return
          end

          local map = function(keymap, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keymap, func, { buffer = event.buf, desc = desc })
          end

          map('K', vim.lsp.buf.hover, 'hover')

          -- map('gd', vim.lsp.buf.definition, "definition")
          map('gd', builtin.lsp_definitions, 'definition')

          -- map('gr', vim.lsp.buf.references, "references")
          map('gr', builtin.lsp_references, 'references')

          -- map('gi', vim.lsp.buf.implementation, "implementation")
          map('gi', builtin.lsp_implementations, 'implementation')

          -- map('go', vim.lsp.buf.type_definition, "type_definition")
          map('go', builtin.lsp_type_definitions, 'type_definition')

          map('gs', vim.lsp.buf.signature_help, 'signature')
          map('gn', vim.lsp.buf.rename, 'rename')
          map('ga', vim.lsp.buf.code_action, 'action')
          map('gq', vim.diagnostic.open_float, 'diagnostics')
          map('gD', vim.lsp.buf.declaration, 'declaration')

          map('gf', format, 'format', { 'n', 'x' })

          map('<leader>cs', builtin.lsp_document_symbols, 'document_symbols')
          map('<leader>cS', builtin.lsp_dynamic_workspace_symbols, 'workspace_symbols')

          -- client.server_capabilities.semanticTokensProvider = nil

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function()
              vim.lsp.buf.clear_references()
            end,
          })
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      require('mason-tool-installer').setup {
        ensure_installed = { 'lua_ls', 'stylua' },
      }

      require('mason-lspconfig').setup {
        automatic_installation = false,
        handlers = {
          -- Default
          function(server_name)
            require('lspconfig')[server_name].setup {}
          end,

          -- Lua
          lua_ls = function()
            require('lspconfig').lua_ls.setup {
              settings = {
                Lua = {
                  diagnostics = { disable = { 'missing-fields' } },
                },
              },
            }
          end,
        },
      }
    end,
  },
}
