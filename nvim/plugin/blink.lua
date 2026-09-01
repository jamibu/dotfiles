vim.pack.add({ 'https://github.com/saghen/blink.lib', 'https://github.com/saghen/blink.cmp' })
local cmp = require('blink.cmp')
cmp.build():pwait()
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

  -- I had to do a bunch to get the signature working consistently
  -- when auto pairs is also enabled
  signature = {
    enabled = true,
    window = { border = 'rounded' },
    trigger = {
      enabled = true,
      show_on_insert = true,
      show_on_accept = true,
    },
  },

  -- With auto pairs this signature does not show if you autocomplete
  -- (also doesn't show if the LSP autocompletes the brackets itself e.g. gopls)
  -- this keymap triggers the signature to show after an autocompletion is accepted
  -- keymap = {
  --   preset = 'default',
  --   ['<C-y>'] = {
  --     function(cmp)
  --       if cmp.is_visible() then
  --         local accepted = cmp.accept()
  --         -- This will show the help as well as the signature.
  --         -- Signature config above only shows signature
  --         -- I like this behaviour (help shown at first goes away as I type)
  --         vim.schedule(function() vim.lsp.buf.signature_help() end)
  --         return accepted
  --       end
  --     end,
  --     'fallback',
  --   },
  -- },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = { implementation = 'prefer_rust_with_warning' },
})

vim.lsp.config('*', { capabilities = cmp.get_lsp_capabilities() })

vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpCompletionAccepted', -- verify exact event name in blink's source/docs
  callback = function()
    vim.schedule(function() vim.lsp.buf.signature_help() end)
  end,
})
