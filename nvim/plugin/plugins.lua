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
})

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
