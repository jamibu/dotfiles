return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        config = function()
            -- This is where you modify the settings for lsp-zero
            -- Note: autocompletion settings will not take effect
            require('lsp-zero.settings').preset({})
        end
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'onsails/lspkind.nvim' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
            -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp
            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            vim.cmd([[highlight! default link CmpItemKind CmpItemMenuDefault]])
            vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

            require('lsp-zero.cmp').extend()
            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero.cmp').action()
            local lspkind = require('lspkind')
            local luasnip = require('luasnip')

            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                mapping = {
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                sources = cmp.config.sources({
                    { name = 'path' },
                    { name = 'cmdline' },
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'luasnip' }, -- For luasnip users.
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    format = lspkind.cmp_format {
                        with_text = true,
                        menu = {
                            buffer = "[buf]",
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[api]",
                            path = "[path]",
                            luasnip = "[snip]",
                            gh_issues = "[issues]",
                            tn = "[TabNine]",
                        },
                    },
                },
                experimental = {
                    ghost_text = true,
                },
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'williamboman/mason.nvim' },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp = require('lsp-zero')

            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr }
                lsp.default_keymaps(opts)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

                vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', "<leader>r", vim.lsp.buf.rename, opts)
                vim.keymap.set('n', "<leader>a", vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
                vim.keymap.set("n", '<C-h>', vim.lsp.buf.signature_help, opts)
            end)

            -- (Optional) Configure lua language server for neovim
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
            lspconfig.htmx.setup({ filetypes = { "html", "templ" } })
            lspconfig.gopls.setup({ filetypes = { "go", "templ" } })
            lspconfig.tailwindcss.setup({
                filetypes = { "templ", "javascript", "typescript", "html" },
                init_options = { userLanguages = { templ = "html" } }
            })

            lsp.setup()
            vim.diagnostic.config({
                virtual_text = true
            })
        end
    },
    {
        "williamboman/mason.nvim"
    }
}
