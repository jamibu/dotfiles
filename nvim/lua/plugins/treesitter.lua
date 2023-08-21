local Plugin = { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }

Plugin.opts = {
    highlight = {
        enable = true,
    },
    ensure_installed = {
        'go',
        'rust',
        'odin',
        'c',
        'cpp',
        'python',
        'toml',
        'yaml',
        'json',
        'lua',
        'markdown',
        'javascript',
        'css',
        'html',
        'query',
    },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
}

function Plugin.config(name, opts)
    require('nvim-treesitter.configs').setup(opts)
end

return Plugin
