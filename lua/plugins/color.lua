return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
    lazy=false,
		config = function()
			require("nvim-treesitter").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
			require("nvim-treesitter").install({
				"lua",
				"vim",
				"json",
				"json5",
				"markdown",
				"python",
				"c",
			})
		end,
	},
}
