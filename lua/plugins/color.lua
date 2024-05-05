local link = "jacoborus/tender.vim"
local name = "tender"
return {
    link,
    config = function()
	vim.cmd('colorscheme '..name)
	vim.cmd("highlight lineNr guibg=none")
	vim.cmd("highlight lineNr guifg=none")
    end
}

