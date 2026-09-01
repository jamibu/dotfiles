vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/NeogitOrg/neogit',
  'https://github.com/ThePrimeagen/refactoring.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/folke/trouble.nvim',
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/mbbill/undotree',
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
})

-- Gitsigns
require('gitsigns').setup({
  signcolumn = false, -- let mini.diff own the gutter
  numhl = false,
  linehl = false,
  word_diff = false,
  signs = { add = {}, change = {}, delete = {}, topdelete = {}, changedelete = {} },

  current_line_blame = false, -- always-on, updates as cursor moves
  current_line_blame_opts = {
    delay = 300,
    virt_text_pos = 'eol',
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
})

-- Harpoon
require('harpoon'):setup() -- required, wires up autocmds

-- Trouble
require('trouble').setup()

-- Oil
require('oil').setup({
  delete_to_trash = true,
})

require('treesitter-context').setup({
  enable = true,
  max_lines = 3,
  trim_scope = 'outer',
  mode = 'cursor',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function(args)
    local ft = args.match
    local lang = vim.treesitter.language.get_lang(ft) or ft

    -- Only bother if nvim-treesitter actually knows this language
    local ts = require('nvim-treesitter')
    if not vim.tbl_contains(ts.get_available(), lang) then
      return
    end

    -- Install if missing (no-op if already installed), then start highlighting
    if #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0 then
      ts.install(lang):wait(30000) -- blocks up to 30s on first open of a new language
    end

    pcall(vim.treesitter.start, args.buf, lang)
  end,
})

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind == 'update' then
      vim.cmd('TSUpdate')
    end
  end,
})
