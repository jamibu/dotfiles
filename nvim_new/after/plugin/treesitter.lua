local ts = require('nvim-treesitter.configs')

ts.setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    ensure_installed = {
        "markdown",
        "tsx",
        "typescript",
        "javascript",
        "toml",
        "c",
        "cpp",
        "json",
        "yaml",
        "rust",
        "css",
        "html",
        "lua",
        "python",
        "vim",
        "query",
        "go",
    },
    rainbow = {
        enable = true,
        disable = { "html" },
        extended_mode = false,
        max_file_lines = nil,
    },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
})
