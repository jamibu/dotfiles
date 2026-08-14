-- Spaces instead of tab
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Don't wrap
vim.o.wrap = false

-- ============================================================
-- This is mostly taken from the Kickstart config
-- ============================================================
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Line numbers to the left
vim.o.number = true -- Line numbers to left
-- Make line numbers relative to help with jumping
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Enable undo/redo changes even after closing and reopening a file
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-guide-options`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- ============================================================
-- This is mostly taken from the MiniMax config
-- ============================================================
vim.o.pumborder      = 'single'   -- Use border in popup menu
vim.o.pumheight      = 10         -- Make popup menu smaller
vim.o.pummaxwidth    = 100        -- Make popup menu not too wide

-- Builtin auto indenting
vim.o.autoindent = true

-- Improve comment editing
vim.o.formatoptions = "rqnl1j" -- Improve comment editing

vim.o.colorcolumn = "+1"

vim.o.incsearch = true
vim.o.infercase = true
vim.o.smartindent = true

vim.o.shortmess      = 'CFOSWaco' -- Disable some built-in completion messages
vim.o.splitkeep      = 'screen'   -- Reduce scroll during window split
vim.o.winborder      = 'single'   -- Use border in floating windows
vim.o.ruler          = false      -- Don't show cursor coordinates (shown in status bar)

-- COMPLETION
vim.o.complete        = '.,w,b,kspell'                  -- Use less sources
vim.o.completeopt     = 'menuone,noselect,fuzzy,nosort' -- Use custom behavior
vim.o.completetimeout = 100                             -- Limit sources delay

-- Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
-- Do on `FileType` to always override these changes from filetype plugins.
vim.api.nvim_create_autocmd('FileType', {
  callback = function() vim.cmd('setlocal formatoptions-=c formatoptions-=o') end,
})

-- Cleaning up diagnostic, only show text on current line, signs otherwise
vim.diagnostic.config({
  signs = { severity = { min = 'WARN', max = 'ERROR' } },
  underline = { severity = { min = 'HINT', max = 'ERROR' } },
  virtual_text = { current_line = true, severity = { min = 'ERROR', max = 'ERROR' } },
  update_in_insert = false,
})
