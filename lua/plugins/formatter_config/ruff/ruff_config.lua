require('lspconfig').ruff.setup({
    init_options = {
	settings = {
	    configuration = "~/.config/nvim/lua/formatter_config/ruff/ruff.toml"
	}
    }
})
