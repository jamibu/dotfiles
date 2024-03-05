return {
    { 'folke/neodev.nvim' },
    { 'folke/which-key.nvim' },
    { 'simrat39/rust-tools.nvim',       event = 'VeryLazy' },
    { 'mbbill/undotree',                event = 'VeryLazy' },
    { 'numToStr/Comment.nvim',          event = 'VeryLazy',    config = true },
    { 'windwp/nvim-autopairs',          event = "InsertEnter", opts = {} },
    { 'windwp/nvim-ts-autotag' },
    { "HiPhish/rainbow-delimiters.nvim" },
    { 'folke/neoconf.nvim',             cmd = 'Neoconf' },
    { 'norcalli/nvim-colorizer.lua' },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
        },
        config = true
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
}
