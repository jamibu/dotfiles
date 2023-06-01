local attaches = function()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
  vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})

  vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
  vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
  vim.keymap.set('n', "<leader>r", vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set('n', "<leader>a", vim.lsp.buf.code_action, {buffer=0})
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {buffer=0})
  vim.keymap.set("n", '<C-h>', vim.lsp.buf.signature_help, {buffer=0})
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- ACTIVATE and CONFIGURE LANGUAGE SERVERS
require'lspconfig'.gopls.setup{
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

require'lspconfig'.bashls.setup{
  on_attach = attaches,
  capabilities = capabilities,
}

require'lspconfig'.intelephense.setup{
  on_attach = attaches,
  capabilities = capabilities,
}

require'lspconfig'.yamlls.setup{
  on_attach = attaches,
  capabilities = capabilities,
}

require'lspconfig'.racket_langserver.setup{
  on_attach = attaches,
  capabilities = capabilities,
}

-- AUTO COMPLETION STUFF
vim.opt.completeopt={"menu", "menuone", "noselect"}
-- Set up nvim-cmp.
local cmp = require'cmp'

local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
end

lspkind.init()

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  }),

  formatting = {
    -- Youtube: How to set up nice formatting for your sources.
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
        gh_issues = "[issues]",
        tn = "[TabNine]",
      },
    },
  },

  experimental = {
    -- I like the new menu better! Nice work hrsh7th
    native_menu = false,

    -- Let's play with this for a day or two
    ghost_text = false,
  },

})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

