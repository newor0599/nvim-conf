vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr, silent = true }

    -- Define a helper function for setting key mappings
    local function buf_set_keymap(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Set up key mappings for LSP features
    --buf_set_keymap("n", "gd", vim.lsp.buf.definition)
    buf_set_keymap("n", "gh", vim.lsp.buf.hover)
    --buf_set_keymap("n", "gi", vim.lsp.buf.implementation)
    --buf_set_keymap("n", "<C-k>", vim.lsp.buf.signature_help)
    --buf_set_keymap("n", "<leader>rn", vim.lsp.buf.rename)
    --buf_set_keymap("n", "gr", vim.lsp.buf.references)
    buf_set_keymap("n", "<leader>ca", vim.lsp.buf.code_action)
    buf_set_keymap("n", ']d', vim.diagnostic.goto_next)
    buf_set_keymap("n", '[d', vim.diagnostic.goto_prev)
    --[[
        -- Neovim auto completion
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        vim.keymap.set("i", "<C-CR>", "<C-x><C-o>", { noremap = true, silent = true })
        ]] --
  end,
})
vim.o.updatetime = 250
-- Show diagnostics in a floating window on CursorHold
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- Format on write
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    vim.lsp.buf.format()
  end
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
  filetypes = { "css", 'scss' }
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
    },
  },
}
vim.lsp.enable("lua_ls")

-- Pyright documentation
vim.lsp.config["pyright"] = {
  filetypes = { "python" },
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
}
vim.lsp.enable("pyright")
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

-- Python
vim.lsp.config["ruff"] = {
  capabilities = require 'blink.cmp'.get_lsp_capabilities(),
  filetypes = { 'python' },
  init_options = {
    settings = {
      configuration = "~/.config/nvim/lua/ruff.toml"
    }
  }
}
vim.lsp.enable("ruff")

-- Typescript
vim.lsp.config["ts_ls"] = {
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", },
}
vim.lsp.enable("ts_ls")

-- JSON
vim.lsp.config["jsonls"] = { filetypes = { "json" } }
vim.lsp.enable("jsonls")
