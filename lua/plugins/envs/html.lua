local lspconfig = require("lspconfig")
lspconfig.htmlls.setup({
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
})
