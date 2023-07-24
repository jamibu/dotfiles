local Plugin = { 'nvim-treesitter/nvim-treesitter' }

Plugin.dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects' }
}

-- See :help nvim-treesitter-modules
Plugin.opts = {
    highlight = {
        enable = true,
    },
    -- :help nvim-treesitter-textobjects-modules
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            }
        },
    },
    ensure_installed = {
        'typescript',
        "javascript",
        'tsx',
        'css',
        'html',
        'php',
        'lua',
        'vim',
        'vimdoc',
        'json',
        "markdown",
        "toml",
        "c",
        "cpp",
        "yaml",
        "rust",
        "go",
        "odin",
        "python",
        "query",
    },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
}

function Plugin.config(name, opts)
    require('nvim-treesitter.configs').setup(opts)
end

return Plugin
