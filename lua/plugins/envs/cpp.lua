local lspconfig = require("lspconfig")
lspconfig.clangd.setup({
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  cmd = { 'clangd', '--background-index', '--clang-tidy' },
  init_options = {
    fallbackFlags = { '-std=c++17' },
  },
})
