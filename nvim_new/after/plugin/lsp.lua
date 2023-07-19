local attaches = function(client, bufnr)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})

    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set('n', "<leader>r", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set('n', "<leader>a", vim.lsp.buf.code_action, {buffer=0})
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {buffer=0})
    vim.keymap.set("n", '<C-h>', vim.lsp.buf.signature_help, {buffer=0})

    -- format on save
    -- if client.server_capabilities.documentFormattingProvider then
    --     vim.api.nvim_create_autocmd("BufWritePre", {
    --         group = vim.api.nvim_create_augroup("Format", { clear = true }),
    --         buffer = bufnr,
    --         callback = function()
    --             vim.lsp.buf.formatting_seq_sync()
    --         end,
    --     })
    -- end
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- ACTIVATE and CONFIGURE LANGUAGE SERVERS
require'lspconfig'.gopls.setup{
  on_attach = attaches,
  capabilities = capabilities,
}

require'lspconfig'.clangd.setup{
  on_attach = attaches,
  capabilities = capabilities,
}

require'lspconfig'.rust_analyzer.setup{
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
  on_attach = attaches,
  capabilities = capabilities,
}

require'lspconfig'.pyright.setup{
  on_attach = attaches,
  capabilities = capabilities,
}

require'lspconfig'.tsserver.setup{
  on_attach = attaches,
  capabilities = capabilities,
}

require'lspconfig'.yamlls.setup{
  on_attach = attaches,
  capabilities = capabilities,
}
