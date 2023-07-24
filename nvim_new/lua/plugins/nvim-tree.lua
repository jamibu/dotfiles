local Plugin = {'kyazdani42/nvim-tree.lua'}

vim.keymap.set('n', '<Leader>nt', '<Cmd>NvimTreeToggle<CR>')

Plugin.name = 'nvim-tree'
Plugin.cmd = {'NvimTreeToggle'}

-- See :help nvim-tree-setup
Plugin.opts = {
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
}

return Plugin
