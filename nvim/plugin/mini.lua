vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

-- Icons — used by mini.pick, mini.statusline, and others. Install first.
require('mini.icons').setup()
-- Statusline
require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.notify').setup()

-- Fuzzy finder / picker — files, grep, buffers, help tags, etc.
require('mini.starter').setup()
require('mini.sessions').setup()
require('mini.files').setup({ windows = { preview = true } })
require('mini.pick').setup()
require('mini.extra').setup()
require('mini.cmdline').setup()
-- Surround actions: saiw), sd', sr}] etc.
require('mini.surround').setup()
-- Textobjects: ci), dab, va" etc. — extends built-in a/i objects
require('mini.ai').setup()
-- Autopairs
require('mini.pairs').setup()

require('mini.git').setup()
require('mini.diff').setup({
  view = { style = 'number' },
})

-- Clue
local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    { mode = { 'n', 'x' }, keys = '<Leader>' },
  },

  clues = {
    -- Group labels shown before you've typed the second key
    { mode = 'n', keys = '<Leader>c', desc = 'Trouble (LSP)' },
    { mode = 'n', keys = '<Leader>e', desc = 'Files' },
    { mode = 'n', keys = '<Leader>f', desc = 'Find' },
    { mode = 'n', keys = '<Leader>g', desc = 'Git' },
    { mode = 'n', keys = '<Leader>h', desc = 'Harpoon' },
    { mode = 'n', keys = '<Leader>l', desc = 'LSP' },
    { mode = 'n', keys = '<Leader>t', desc = 'Toggle' },
    { mode = 'n', keys = '<Leader>u', desc = 'Undotree' },
    { mode = 'n', keys = '<Leader>x', desc = 'Trouble' },
  },

  window = {
    delay = 300, -- ms before popup shows; default is 1000 if omitted
  },
})

--- Snippets
-- Define language patterns to work better with 'friendly-snippets'
local latex_patterns = { 'latex/**/*.json', '**/latex.json' }
local lang_patterns = {
  tex = latex_patterns,
  plaintex = latex_patterns,
  -- Recognize special injected language of markdown tree-sitter parser
  markdown_inline = { 'markdown.json' },
}

local snippets = require('mini.snippets')
local config_path = vim.fn.stdpath('config')
snippets.setup({
  snippets = {
    -- Always load 'snippets/global.json' from config directory
    snippets.gen_loader.from_file(config_path .. '/snippets/global.json'),
    -- Load from 'snippets/' directory of plugins, like 'friendly-snippets'
    snippets.gen_loader.from_lang({ lang_patterns = lang_patterns }),
  },
})

-- Completion — pairs with the complete/completeopt/completetimeout you
-- already set in options.lua
-- require('mini.completion').setup()

-- Advertise completion capabilities to LSP servers (from our earlier LSP chat)
-- vim.lsp.config('*', { capabilities = require('mini.completion').get_lsp_capabilities() })
