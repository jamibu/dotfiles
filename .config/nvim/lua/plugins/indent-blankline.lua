local Plugin = { 'lukas-reineke/indent-blankline.nvim' }

Plugin.name = 'indent_blankline'

Plugin.main = "ibl"

Plugin.event = { 'BufReadPost', 'BufNewFile' }

-- See :help indent-blankline-setup
Plugin.opts = {}

return Plugin
