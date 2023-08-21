local Plugins = {
    -- {'tpope/vim-fugitive'},
    -- {'wellle/targets.vim'},
    {'tpope/vim-repeat'},
    {'kyazdani42/nvim-web-devicons', lazy = true},
    {'numToStr/Comment.nvim', config = true, event = 'VeryLazy'},
    {'norcalli/nvim-colorizer.lua'},
    {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' },
    {'windwp/nvim-autopairs'},
    {'windwp/nvim-ts-autotag'},
    {"mbbill/undotree"},
    {"HiPhish/rainbow-delimiters.nvim"},

    -- Themes
    {'folke/tokyonight.nvim'},
    -- {'joshdick/onedark.vim'},
    -- {'tanvirtin/monokai.nvim'},
    -- {'lunarvim/darkplus.nvim'},
    {"catppuccin/nvim", as = "catppuccin"},
    {"EdenEast/nightfox.nvim"},
    {"rebelot/kanagawa.nvim"},
}

return Plugins
