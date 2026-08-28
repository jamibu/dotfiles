vim.pack.add({
  'https://github.com/saghen/blink.lib',
  'https://github.com/saghen/blink.cmp',
})

vim.api.nvim_create_autocmd('PackChanged', {
  pattern = 'blink.cmp',
  callback = function(ev)
    vim.cmd('BlinkCmp build')
  end,
})

local cmp = require('blink.cmp')

cmp.setup({
  completion = {
    -- Show ghost text (preview of the completion inline in your buffer)
    ghost_text = { enabled = true },
    -- Auto-open the docs popup when an item is selected
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    -- Auto-insert brackets for functions/methods based on LSP semantic tokens
    accept = {
      auto_brackets = { enabled = true },
    },
    menu = {
      border = 'rounded',
      draw = {
        columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'kind' } },
      },
    },
  },

  signature = { enabled = true, window = { border = 'rounded' } },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = { implementation = 'prefer_rust_with_warning' },
})

vim.lsp.config('*', { capabilities = cmp.get_lsp_capabilities() })

vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities() })
