local link = "EdenEast/nightfox.nvim"
local name = "duskfox"
return {
    link,
    config = function()
	vim.o.termguicolors = true
	vim.cmd('colorscheme '..name)
	vim.cmd("highlight lineNr guibg=none")
	vim.cmd("highlight lineNr guifg=none")
    end
}

