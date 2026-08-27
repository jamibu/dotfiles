vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

-- Icons — used by mini.pick, mini.statusline, and others. Install first.
require('mini.icons').setup()

-- Colorscheme — mini.nvim ships a few (built on mini.hues). Optional if you
-- already have one you like; this is just an easy default to start from.
vim.cmd.colorscheme('miniwinter')

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
