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
		ensure_installed = { 
		    "lua_ls", 
		    "pyright",
		    "tsserver"
		},
	    }
	end
    }
}
