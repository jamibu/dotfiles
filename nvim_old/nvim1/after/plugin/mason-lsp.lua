local masonlsp = require("mason-lspconfig")

masonlsp.setup({
    automatic_installation = true,
    ensure_installed = {
        "cssls",
        "eslint",
        "html",
        "jsonls",
        "tsserver",
        "pyright",
        "tailwindcss",
        "rust_analyzer",
        "gopls",
        "clangd",
    },
})
