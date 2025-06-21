local lspconfig = require("lspconfig")
lspconfig.ruff.setup({
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
})
-- Pyright documentation
lspconfig.pyright.setup({
  settings = {
    pyright = {
      disableOrganizeImports = true
    },
    python = {
      analysis = {
        ignore = { '*' }
      }
    }
  }
})
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})
