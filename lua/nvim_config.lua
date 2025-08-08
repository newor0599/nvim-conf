-- Line number
vim.cmd("set relativenumber")
vim.cmd("set number")

-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  command = "silent! mkview"
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function(args)
    if vim.bo[args.buf].filetype == "oil" or true then
      vim.cmd("silent! loadview")
    end
  end,
})

-- Textwrap
vim.cmd("set nowrap")

-- Tab to spaces
vim.opt.tabstop = 2      -- Tab key inserts 2 spaces
vim.opt.shiftwidth = 2   -- Indent is 2 spaces
vim.opt.expandtab = true -- Convert tabs to spaces

-- GUI
vim.o.winborder = "rounded"
vim.cmd('colorscheme bamboo')

-- Close buffer but ensure Neovim stays open with an empty buffer
--[[
vim.keymap.set("n", "<leader>x", function()
  if #vim.fn.getbufinfo({ buflisted = 1 }) <= 1 then
    vim.cmd("enew") -- Create new empty buffer first
    vim.cmd("bd #") -- Delete the previous (now becomes #)
  else
    vim.cmd("bd")   -- Just delete current buffer
  end
end)
--]]
