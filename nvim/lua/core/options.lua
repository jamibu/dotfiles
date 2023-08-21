-- Number line. 
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"   -- for Git signs, diagnostics etc

-- Tabs and indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = false 
vim.opt.incsearch = true

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- Other visual stuff
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Nice undos (goes great with undotree)
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Yank stuff goes on clipboard and vice versa. 
vim.opt.clipboard = "unnamedplus"

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- For have Racket TS, LSP etc work with CFTool
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.cft" }, command = "setfiletype racket" }
)

-- From TJ
-- Cool floating window popup menu for completion on command line
-- vim.opt.pumblend = 17
-- vim.opt.wildmode = "longest:full"
-- vim.opt.wildoptions = "pum"

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
