local nmap = function(lhs, rhs, desc)
  -- See `:h vim.keymap.set()`
  vim.keymap.set('n', lhs, rhs, { desc = desc })
end

local nmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end

nmap_leader('ff', '<Cmd>Pick files<CR>',        'Files')
nmap_leader('fg', '<Cmd>Pick grep_live<CR>',    'Grep live')
nmap_leader('fb', '<Cmd>Pick buffers<CR>',      'Buffers')

