local link = "rebelot/kanagawa.nvim"
local name = "kanagawa"
return {
    link,
    config = function()
	vim.cmd('colorscheme '..name)
	require('kanagawa').setup({
	    transparent = true
	})
	vim.cmd("KanagawaCompile")
    end
}

