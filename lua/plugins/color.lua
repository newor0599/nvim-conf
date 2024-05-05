local link = "EdenEast/nightfox.nvim"
local name = "nightfox"
return {
    link,
    config = function()
	vim.cmd('colorscheme '..name)
	vim.cmd("highlight lineNr guibg=none")
	vim.cmd("highlight lineNr guifg=none")
    end
}

