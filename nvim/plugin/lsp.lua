vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
})

vim.lsp.enable({
  "lua_ls",
  "gopls",
  "rust_analyzer",
  "ols",
  "ruff",
  "ty",
  "prettier",
  "eslint",
})

require('mason').setup()
