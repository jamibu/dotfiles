return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {'<leader><space>', '<cmd>Telescope buffers show_all_buffers=true<cr>', desc = 'Switch Buffer'},
        {'<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files (root dir)'},
        {'<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Grep (root dir)'},
        {'<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Workspace diagnostics'},
        {'<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers'},
        {'<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help tags'},
        {'<leader>fr', '<cmd>Telescope lsp_references<cr>', desc = 'LSP References'},
    }
}
