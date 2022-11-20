-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- For awesome syntax highlighting
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

  -- Evil code stealing robot
  use 'github/copilot.vim'

  -- Snip snip
  use'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"

  -- Auto close brackets, quotes etc.
  use 'windwp/nvim-autopairs'

  use "mbbill/undotree"
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'nvim-lualine/lualine.nvim'

  -- Pretty themes
  use 'EdenEast/nightfox.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
end)
