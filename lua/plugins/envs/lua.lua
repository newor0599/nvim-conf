local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",         -- Use LuaJIT
      },
      diagnostics = {
        globals = { "vim" },         -- Avoid undefined global warning
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),         -- Make LSP aware of Neovim runtime file
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
