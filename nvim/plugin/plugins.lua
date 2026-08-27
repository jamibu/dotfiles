vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  -- "https://github.com/lewis6991/gitsigns.nvim",
  -- "https://github.com/NeogitOrg/neogit",
})

-- require('gitsigns').setup()
