return {
    "nvim-treesitter/nvim-treesitter",
    config = function ()
    	require("nvim-treesitter").setup({
	    vim.cmd("TSEnable highlight")
	})
    end
}
