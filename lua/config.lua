---@diagnostic disable: undefined-global
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set nowrap")
vim.cmd("set mouse=")
vim.opt.guifont = { "3270 Nerd Font Mono", ":h17" }
vim.opt.fillchars = {eob = " "}
vim.o.selection = "old"

-- Helper function for transparency formatting
local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end

-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.8
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#eeeeee" .. alpha()

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
})
