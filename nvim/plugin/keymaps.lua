local nmap = function(lhs, rhs, desc)
  -- See `:h vim.keymap.set()`
  vim.keymap.set('n', lhs, rhs, { desc = desc })
end

-- Helper for setting normal mode keympaps with leader
--
-- suffix: Keys after leader
-- rhs: Command to run
-- desc: Description, used with mini-clue
local nmap_leader = function(suffix, rhs, desc) vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc }) end

-- Other
nmap('<Esc>', '<cmd>nohlsearch<CR>', 'Clear highlights')

-- Picker
local pick_added_hunks_buf = '<Cmd>Pick git_hunks path="%" scope="staged"<CR>'
local pick_workspace_symbols_live = '<Cmd>Pick lsp scope="workspace_symbol_live"<CR>'

nmap_leader('f/', '<Cmd>Pick history scope="/"<CR>', '"/" history')
nmap_leader('f:', '<Cmd>Pick history scope=":"<CR>', '":" history')
nmap_leader('fa', '<Cmd>Pick git_hunks scope="staged"<CR>', 'Added hunks (all)')
nmap_leader('fA', pick_added_hunks_buf, 'Added hunks (buf)')
nmap_leader('fb', '<Cmd>Pick buffers<CR>', 'Buffers')
nmap_leader('fc', '<Cmd>Pick git_commits<CR>', 'Commits (all)')
nmap_leader('fC', '<Cmd>Pick git_commits path="%"<CR>', 'Commits (buf)')
nmap_leader('fd', '<Cmd>Pick diagnostic scope="all"<CR>', 'Diagnostic workspace')
nmap_leader('fD', '<Cmd>Pick diagnostic scope="current"<CR>', 'Diagnostic buffer')
nmap_leader('ff', '<Cmd>Pick files<CR>', 'Files')
nmap_leader('fg', '<Cmd>Pick grep_live<CR>', 'Grep live')
nmap_leader('fG', '<Cmd>Pick grep pattern="<cword>"<CR>', 'Grep current word')
nmap_leader('fh', '<Cmd>Pick help<CR>', 'Help tags')
nmap_leader('fH', '<Cmd>Pick hl_groups<CR>', 'Highlight groups')
nmap_leader('fl', '<Cmd>Pick buf_lines scope="all"<CR>', 'Lines (all)')
nmap_leader('fL', '<Cmd>Pick buf_lines scope="current"<CR>', 'Lines (buf)')
nmap_leader('fm', '<Cmd>Pick git_hunks<CR>', 'Modified hunks (all)')
nmap_leader('fM', '<Cmd>Pick git_hunks path="%"<CR>', 'Modified hunks (buf)')
nmap_leader('fr', '<Cmd>Pick resume<CR>', 'Resume')
nmap_leader('fR', '<Cmd>Pick lsp scope="references"<CR>', 'References (LSP)')
nmap_leader('fs', pick_workspace_symbols_live, 'Symbols workspace (live)')
nmap_leader('fS', '<Cmd>Pick lsp scope="document_symbol"<CR>', 'Symbols document')
nmap_leader('fv', '<Cmd>Pick visit_paths cwd=""<CR>', 'Visit paths (all)')
nmap_leader('fV', '<Cmd>Pick visit_paths<CR>', 'Visit paths (cwd)')

-- Git
nmap_leader('gg', '<Cmd>Neogit<CR>', 'Neogit')
nmap_leader('gb', '<Cmd>Gitsigns blame<CR>', 'Git blame')
nmap_leader('gl', '<Cmd>Gitsigns blame_line<CR>', 'Git blame')

nmap_leader('tb', function() require('gitsigns').toggle_current_line_blame() end, 'Toggle line blame')

nmap_leader('ut', '<Cmd>UndotreeToggle<CR>', 'Undotree')

-- Harpoon
nmap_leader(
  'he',
  function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end,
  'Harpoon quick menu'
)
nmap_leader('ha', function() require('harpoon'):list():add() end, 'Harpoon add file')
nmap_leader('1', function() require('harpoon'):list():select(1) end, 'Harpoon file 1')
nmap_leader('2', function() require('harpoon'):list():select(2) end, 'Harpoon file 2')
nmap_leader('3', function() require('harpoon'):list():select(3) end, 'Harpoon file 3')
nmap_leader('4', function() require('harpoon'):list():select(4) end, 'Harpoon file 4')
nmap_leader('5', function() require('harpoon'):list():select(5) end, 'Harpoon file 5')

-- Mini Files
-- e is for 'Explore' and 'Edit'. Common usage:
-- - `<Leader>ed` - open explorer at current working directory
-- - `<Leader>ef` - open directory of current file (needs to be present on disk)
-- - `<Leader>ei` - edit 'init.lua'
-- - All mappings that use `edit_plugin_file` - edit 'plugin/' config files
local edit_plugin_file = function(filename)
  return string.format('<Cmd>edit %s/plugin/%s<CR>', vim.fn.stdpath('config'), filename)
end
local explore_at_file = '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>'
local explore_quickfix = function() vim.cmd(vim.fn.getqflist({ winid = true }).winid ~= 0 and 'cclose' or 'copen') end
local explore_locations = function() vim.cmd(vim.fn.getloclist(0, { winid = true }).winid ~= 0 and 'lclose' or 'lopen') end

nmap_leader('ed', '<Cmd>lua MiniFiles.open()<CR>', 'Directory')
nmap_leader('ef', explore_at_file, 'File directory')
nmap_leader('en', '<Cmd>lua MiniNotify.show_history()<CR>', 'Notifications')
nmap_leader('eq', explore_quickfix, 'Quickfix list')
nmap_leader('eQ', explore_locations, 'Location list')
nmap_leader('ei', '<Cmd>edit $MYVIMRC<CR>', 'init.lua')
nmap_leader('ek', edit_plugin_file('keymaps.lua'), 'Keymaps config')
nmap_leader('em', edit_plugin_file('mini.lua'), 'MINI config')
nmap_leader('eo', edit_plugin_file('options.lua'), 'Options config')
nmap_leader('ep', edit_plugin_file('plugins.lua'), 'Plugins config')

-- LSP
nmap_leader('la', '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'Actions')
nmap_leader('ld', '<Cmd>lua vim.diagnostic.open_float()<CR>', 'Diagnostic popup')
nmap_leader('lf', '<Cmd>lua require("conform").format()<CR>', 'Format')
nmap_leader('li', '<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation')
nmap_leader('lh', '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Hover')
nmap_leader('ll', '<Cmd>lua vim.lsp.codelens.run()<CR>', 'Lens')
nmap_leader('lr', '<Cmd>lua vim.lsp.buf.rename()<CR>', 'Rename')
nmap_leader('lR', '<Cmd>lua vim.lsp.buf.references()<CR>', 'References')
nmap_leader('ls', '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Source definition')
nmap_leader('lt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition')

-- Trouble
nmap_leader('xx', '<cmd>Trouble diagnostics toggle<cr>', 'Diagnostics (Trouble)')
nmap_leader('xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', 'Buffer Diagnostics (Trouble)')
nmap_leader('xL', '<cmd>Trouble loclist toggle<cr>', 'Location List (Trouble)')
nmap_leader('xQ', '<cmd>Trouble qflist toggle<cr>', 'Quickfix List (Trouble)')
nmap_leader('cs', '<cmd>Trouble symbols toggle focus=false<cr>', 'Symbols (Trouble)')
nmap_leader(
  'cl',
  '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
  'LSP Definitions / references / ... (Trouble)'
)

-- Oil
nmap('-', '<CMD>Oil<CR>', 'Open parent directory')
