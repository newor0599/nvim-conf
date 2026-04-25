vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr, silent = true }

    -- Define a helper function for setting key mappings
    local function buf_set_keymap(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Set up key mappings for LSP features
    buf_set_keymap("n", "gd", vim.lsp.buf.definition)
    buf_set_keymap("n", "gh", vim.lsp.buf.hover)
    buf_set_keymap("n", "gi", vim.lsp.buf.implementation)
    --buf_set_keymap("n", "<C-k>", vim.lsp.buf.signature_help)
    buf_set_keymap("n", "<leader>rn", vim.lsp.buf.rename)
    buf_set_keymap("n", "gr", vim.lsp.buf.references)
    buf_set_keymap("n", "<leader>ca", vim.lsp.buf.code_action)
  end,
})

-- Bash
vim.lsp.config["bashls"] = {
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' }
}
vim.lsp.enable("bashls")

-- C family
vim.lsp.config["clangd"] = {
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  cmd = { 'clangd', '--background-index', '--clang-tidy' },
  init_options = {
    fallbackFlags = {},
  },
  filetypes = { 'cpp', 'c', 'cs' }
}
vim.lsp.enable("clangd")

-- Css
vim.lsp.config["cssls"] = {
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
  filetypes = { "css", 'scss' },
  cmd = { "vscode-css-language-server", '--stdio' }
}
vim.lsp.enable("cssls")

-- Lua
vim.lsp.config["lua_ls"] = {
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Use LuaJIT
      },
      diagnostics = {
        globals = { "vim" }, -- Avoid undefined global warning
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Make LSP aware of Neovim runtime file
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
      format = {
        enable = true,
      }
    },
  },
}
vim.lsp.enable("lua_ls")

vim.lsp.config["ty"] = {
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  filetypes={'python'},
  cmd={'ty','server'}
}
vim.lsp.enable("ruff")
vim.lsp.enable("ty")

-- Script family
vim.lsp.config["ts_ls"] = {
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", },
  cmd = { 'typescript-language-server', '--stdio' }
}
vim.lsp.enable("ts_ls")

-- JSON
vim.lsp.config["json_ls"] = {
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  filetypes = { "json" },
  cmd = { 'vscode-json-language-server', '--stdio' }
}
vim.lsp.enable("json_ls")

-- HTML
vim.lsp.config['html_ls'] = {
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  filetypes = { 'html' },
  cmd = { 'vscode-html-language-server', '--stdio' }
}
vim.lsp.enable("html_ls")

-- PHP
vim.lsp.config['php_ls'] = {
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  filetypes = { "php" },
  root_markers = { '.git', 'composer.json', '.phpactor.json', '.phpactor.yml' },
  cmd = { 'phpactor', 'language-server', '-vvv' }
}
vim.lsp.enable("php_ls")
