-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Get that good syntax highlighting
  use('nvim-treesitter/nvim-treesitter', {
    run = ':TSUpdate'
  })
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'p00f/nvim-ts-rainbow'

  -- Directory tree 
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-tree/nvim-tree.lua',
     requires = {
       'nvim-tree/nvim-web-devicons', -- optional, for file icons
     },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Telescope <3
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- LSP and cmp stuff
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'onsails/lspkind.nvim'
  use 'williamboman/mason.nvim'

  -- Debugging in Nvim, it can be done!
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'leoluz/nvim-dap-go'
  use 'mfussenegger/nvim-dap-python'

  -- Evil code stealing robot
  use 'github/copilot.vim'

  -- Snip snip
  use'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"

  -- Who has time to close their own brackets?
  use 'windwp/nvim-autopairs'

  -- For fixing when I hit u with capslock on
  use "mbbill/undotree"

  -- Magit but neovim
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- Jumping around
  use { "ggandor/leap.nvim", requires = {"tpope/vim-repeat"} }

  -- Highlight colour codes with colour
  use 'norcalli/nvim-colorizer.lua'

  -- Preview for markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  -- Comments
  use {'numToStr/Comment.nvim'}

  -- Fancy line
  use 'nvim-lualine/lualine.nvim'

  -- Pretty themes
  use 'EdenEast/nightfox.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
end)
