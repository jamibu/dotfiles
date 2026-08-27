vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

-- Icons — used by mini.pick, mini.statusline, and others. Install first.
require('mini.icons').setup()

-- Statusline
require('mini.statusline').setup()

-- Fuzzy finder / picker — files, grep, buffers, help tags, etc.
require('mini.pick').setup()
require('mini.starter').setup()
require('mini.sessions').setup()
require('mini.files').setup()
require('mini.diff').setup({
  view = { style = 'number' },
})
require('mini.git').setup()

require('mini.notify').setup()

-- Clue
local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    { mode = { 'n', 'x' }, keys = '<Leader>' },
  },

  clues = {
    -- Group labels shown before you've typed the second key
    { mode = 'n', keys = '<Leader>f', desc = '+Find' },     -- ff, fg, fb
    { mode = 'n', keys = '<Leader>g', desc = '+Git' },      -- gg, gb, gl
    { mode = 'n', keys = '<Leader>h', desc = '+Harpoon' },  -- ha, he
    { mode = 'n', keys = '<Leader>t', desc = '+Toggle' },   -- tb
  },

  window = {
    delay = 300, -- ms before popup shows; default is 1000 if omitted
  },
})

-- Completion — pairs with the complete/completeopt/completetimeout you
-- already set in options.lua
-- require('mini.completion').setup()

-- Advertise completion capabilities to LSP servers (from our earlier LSP chat)
-- vim.lsp.config('*', { capabilities = require('mini.completion').get_lsp_capabilities() })

require('mini.cmdline').setup()

-- Surround actions: saiw), sd', sr}] etc.
require('mini.surround').setup()

-- Textobjects: ci), dab, va" etc. — extends built-in a/i objects
require('mini.ai').setup()

-- Autopairs
require('mini.pairs').setup()
require('mini.tabline').setup()
