vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
            vim.cmd("TSUpdate")
        end
    end,
})

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-- vim.pack.add({
--   { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('^1') },
-- })
--
-- require('blink.cmp').setup({})
--
-- vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities() })
