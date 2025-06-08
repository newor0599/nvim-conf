local lspconfig = require("lspconfig")
lspconfig.cssls.setup({
    capabilities = require 'blink.cmp'.get_lsp_capabilities(),
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
})
