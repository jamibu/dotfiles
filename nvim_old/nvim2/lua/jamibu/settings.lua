-- Appearence
vim.opt.number = true
vim.opt.relativenumber = true -- Show line numbers
vim.opt.showmatch = true      -- show matching brackets when text indicator is over them
vim.opt.signcolumn = 'yes'
vim.opt.guifont = "JetBrainsMono"
vim.opt.colorcolumn = "80"

-- Behavior
vim.opt.incsearch = true -- Makes search act like search in modern browsers
vim.opt.scrolloff = 10   -- Make it so there are always ten lines below my cursor
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.splitright = true -- Prefer windows splitting to the right
vim.opt.splitbelow = true -- Prefer windows splitting to the bottom

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true
vim.opt.termguicolors = true

-- Folding
vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 0
vim.opt.modelines = 1

-- Copy Stuff
vim.opt.clipboard = "unnamedplus"

vim.opt.undofile = true

-- Cool floating window popup menu for completion on command line
vim.opt.pumblend = 17
vim.opt.wildmode = "longest:full"
vim.opt.wildoptions = "pum"

--- Cursorline highlighting control
--  Only have it on in the active buffer
vim.opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
    vim.api.nvim_create_autocmd(event, {
        group = group,
        pattern = pattern,
        callback = function()
            vim.opt_local.cursorline = value
        end,
    })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
