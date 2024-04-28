return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
	require("nvim-tree").setup({
	    vim.keymap.set("n","<leader>e","<Cmd>NvimTreeFocus<CR>")
	})
	vim.api.nvim_create_autocmd({"QuitPre"}, {
	    callback = function() vim.cmd("NvimTreeClose") end,
	})
    end
}
