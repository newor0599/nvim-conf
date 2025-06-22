require "lspconfig".bashls.setup({
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' }
})
