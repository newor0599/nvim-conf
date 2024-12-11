local mason_packages = {
    "lua_ls", -- Lua language server
    "ts_ls", -- Typescript/Javascript language server
    "zls", -- zig language server
    "cssls", -- css language server
    "html", -- html language server
    "arduino_language_server", -- arduino ino language server
    "ruff" -- python linter, language server, formatter
}

return {
    {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	config = true
    },
    {
	"neovim/nvim-lspconfig",
	config = function()
	    vim.keymap.set('n', 'E', vim.lsp.buf.definition)
	    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
	    vim.keymap.set({ 'n', 'v' }, "<leader>ca", vim.lsp.buf.code_action)
	end
    },
    {
	"williamboman/mason.nvim",
	config = true
    },
    {
	"williamboman/mason-lspconfig.nvim",
	config = function()
	    require("mason-lspconfig").setup {
		ensure_installed = mason_packages
	    }
	end
    },
    -- Luasnip
    {
	"L3MON4D3/LuaSnip",
	dependencies = {
	    "saadparwaiz1/cmp_luasnip",
	    "rafamadriz/friendly-snippets"
	},
	config = function()
	    local ls = require("luasnip")
	    vim.keymap.set({ "i", "s" }, "<C-l>", function() ls.jump(1) end, { silent = true })
	    vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(-1) end, { silent = true })
	end
    },

    -- nvim cmp
    {
	"hrsh7th/nvim-cmp",
	dependencies = {
	    'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-buffer',
	    'hrsh7th/cmp-path',
	    'hrsh7th/cmp-cmdline',
	},
	config = function()
	    local cmp = require 'cmp'
	    cmp.setup({
		snippet = {
		    expand = function(args)
			require('luasnip').lsp_expand(args.body)
		    end,
		},
		window = {
		    completion = cmp.config.window.bordered({
			winhighlight = "Normal:@text,FloatBorder:Conditional,CursorLine:PmenuSel,Search:None"
		    }),
		    documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
		    ['<C-j>'] = cmp.mapping.select_next_item(),
		    ['<C-k>'] = cmp.mapping.select_prev_item(),
		    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
		    ['<C-f>'] = cmp.mapping.scroll_docs(4),
		    ['<C-Space>'] = cmp.mapping.complete(),
		    ['<C-e>'] = cmp.mapping.abort(),
		    ["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
			    local entry = cmp.get_selected_entry()
			    if not entry then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			    end
			    cmp.confirm()
			else
			    fallback()
			end
		    end, { "i", "s", "c", }),
		}),
		sources = cmp.config.sources({
		    { name = 'nvim_lsp' }, -- LSP
		    { name = 'buffer' }, -- Buffer
		    { name = 'path' }, -- Path
		    { name = 'luasnip' }, -- Snippet
		})
	    })

	    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	    cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
		    { name = 'buffer' }
		}
	    })

	    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	    cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
		    { name = 'path' },
		    { name = 'cmdline' },
		    { name = 'buffer' }
		}),
		matching = { disallow_symbol_nonprefix_matching = false }
	    })

	    -- Set up lspconfig.
	    local capabilities = require('cmp_nvim_lsp').default_capabilities()
	    for i, l in ipairs(mason_packages) do
		require('lspconfig')[l].setup {
		    capabilities = capabilities
		}
	    end
	end
    },
}
