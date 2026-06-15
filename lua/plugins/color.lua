return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				ensure_installed = {
					"lua",
					"vim",
					"json",
					"markdown",
					"python",
					"c",
				},
			})
		end,
	},
}
