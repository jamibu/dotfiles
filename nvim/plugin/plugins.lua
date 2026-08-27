vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/NeogitOrg/neogit",
  "https://github.com/ThePrimeagen/refactoring.nvim",
  "https://github.com/rose-pine/neovim",
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/folke/trouble.nvim',
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
  -- "https://github.com/folke/tokyonight.nvim",
})

-- Gitsigns
require('gitsigns').setup({
  signcolumn = false,   -- let mini.diff own the gutter
  numhl = false,
  linehl = false,
  word_diff = false,
  signs = { add = {}, change = {}, delete = {}, topdelete = {}, changedelete = {} },

  current_line_blame = false,  -- always-on, updates as cursor moves
  current_line_blame_opts = {
    delay = 300,
    virt_text_pos = 'eol',
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
})

-- Harpoon
require('harpoon'):setup() -- required, wires up autocmds

vim.cmd.colorscheme('rose-pine')

-- Trouble
require('trouble'):setup()
