vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.enable({ "lua_ls", "gopls", "rust_analyzer" })

-- plugin/40-plugins.lua, alongside your nvim-lspconfig block
vim.pack.add({ 'https://github.com/mason-org/mason.nvim' })
require('mason').setup()

