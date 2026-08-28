vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/stevearc/conform.nvim',
})

vim.lsp.enable({
  'lua_ls',
  'gopls',
  'rust_analyzer',
  'ols',
  'ruff',
  'ty',
  'typescript_language_server',
  'prettier',
  'eslint',
})

-- See also:
-- - `:h Conform`
-- - `:h conform-options`
-- - `:h conform-formatters`
require('conform').setup({
  default_format_opts = {
    -- Allow formatting from LSP server if no dedicated formatter is available
    lsp_format = 'fallback',
  },
  format_on_save = {
    timeout_ms = 500,
  },
  formatters_by_ft = {
    lua = { 'stylua' },
  },
})

require('mason').setup()
