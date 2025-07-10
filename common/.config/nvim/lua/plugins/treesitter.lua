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
        'python',
        'toml',
        'yaml',
        'json',
        'lua',
        'vimdoc',
        'markdown',
        'javascript',
        'css',
        'html',
        'query',
        'ocaml',
    },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
}

function Plugin.config(name, opts)
    require('nvim-treesitter.configs').setup(opts)
end

return Plugin
