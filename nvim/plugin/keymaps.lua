local nmap = function(lhs, rhs, desc)
  -- See `:h vim.keymap.set()`
  vim.keymap.set('n', lhs, rhs, { desc = desc })
end

local nmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end

-- Picker
nmap_leader('ff', '<Cmd>Pick files<CR>',        'Files')
nmap_leader('fg', '<Cmd>Pick grep_live<CR>',    'Grep live')
nmap_leader('fb', '<Cmd>Pick buffers<CR>',      'Buffers')

-- Git
nmap_leader('gg', '<Cmd>Neogit<CR>',   'Neogit')
nmap_leader('gb', '<Cmd>Gitsigns blame<CR>',   'Git blame')
nmap_leader('gl', '<Cmd>Gitsigns blame_line<CR>',   'Git blame')
nmap_leader(
    'tb',
    function() require('gitsigns').toggle_current_line_blame() end,
    'Toggle line blame'
)

-- Harpoon
nmap_leader('ha', function() require('harpoon'):list():add() end, 'Harpoon add file')
nmap_leader('he', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, 'Harpoon quick menu')

nmap_leader('1', function() require('harpoon'):list():select(1) end, 'Harpoon file 1')
nmap_leader('2', function() require('harpoon'):list():select(2) end, 'Harpoon file 2')
nmap_leader('3', function() require('harpoon'):list():select(3) end, 'Harpoon file 3')
nmap_leader('4', function() require('harpoon'):list():select(4) end, 'Harpoon file 4')

