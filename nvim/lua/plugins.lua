
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
    -- Packer
    use("wbthomason/packer.nvim")

    -- Common utilities
    use("nvim-lua/plenary.nvim")

    -- Icons
    use("nvim-tree/nvim-web-devicons")

    -- Statusline
    use({"nvim-lualine/lualine.nvim", requires = { "nvim-web-devicons" }})

    -- Pretty themes
    use { "catppuccin/nvim", as = "catppuccin" }
    use "rebelot/kanagawa.nvim"

    -- Get that good tree buisness
    use('nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate'
    })
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'p00f/nvim-ts-rainbow'

    -- Who has time to close their own brackets?
    use 'windwp/nvim-autopairs'
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- HTML tags etc

    -- That good LSPness
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'onsails/lspkind.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Snip snip
    use'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use "rafamadriz/friendly-snippets"

    -- Debugging in Nvim, it can be done!
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'leoluz/nvim-dap-go'
    use 'mfussenegger/nvim-dap-python'

    -- Package management for LSP, DAP, linters etc etc.
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- For fixing when I hit u with capslock on
    use "mbbill/undotree"

    -- Magit but neovim
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    -- File tree until I get around to learning harpoon or something 
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use 'lewis6991/gitsigns.nvim'

    -- Telescope <3
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Highlight colour codes with colour
    use 'norcalli/nvim-colorizer.lua'

    -- Preview for markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Comments
    use {'numToStr/Comment.nvim'}
end)
