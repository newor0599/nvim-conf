local link = "Sly-Harvey/radium.nvim"
local name = "radium"
return {
    link,
    config = function()
	vim.cmd('colorscheme '..name)
    end
}

