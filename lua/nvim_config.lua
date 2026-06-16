---@diagnostic disable: undefined-global
-- Line number
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.o.guifont = "Iosevka NFP" -- text below applies for VimScript
vim.g.neovide_cursor_animation_length = 0.15
vim.g.neovide_cursor_trail_size = 0.8
vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_particle_density = 2
vim.cmd("set nowrap")

-- Tab to spaces
vim.opt.tabstop = 2 -- Tab key inserts 2 spaces
vim.opt.shiftwidth = 2 -- Indent is 2 spaces
vim.opt.expandtab = true -- Convert tabs to spaces

-- GUI
vim.o.winborder = "rounded"

-- Close buffer but ensure Neovim stays open with an empty buffer
vim.keymap.set("n", "<leader>x", function()
	if #vim.fn.getbufinfo({ buflisted = 1 }) <= 1 then
		vim.cmd("enew") -- Create new empty buffer first
		vim.cmd("bd #") -- Delete the previous (now becomes #)
	else
		vim.cmd("bd") -- Just delete current buffer
	end
end)

-- Kickstart treesitter for python for no reason :(
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { 'python' },
--   callback = function() vim.treesitter.start() end,
-- })
