-- Line number
vim.cmd("set relativenumber")
vim.cmd("set number")

-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Textwrap
vim.cmd("set nowrap")

-- Tab to spaces
vim.opt.tabstop = 2      -- Tab key inserts 2 spaces
vim.opt.shiftwidth = 2   -- Indent is 2 spaces
vim.opt.expandtab = true -- Convert tabs to spaces

-- Custom plugin structure
local plugin_path = "~/.local/share/nvim/plugins/"
plugin_path = vim.fn.expand(plugin_path)
vim.opt.runtimepath:append(plugin_path .. "*")

-- GUI
vim.o.winborder = "rounded"

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  command = "silent! mkview"
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  command = "silent! loadview"
})

-- Close buffer but ensure Neovim stays open with an empty buffer
vim.keymap.set("n", "<leader>x", function()
  if #vim.fn.getbufinfo({ buflisted = 1 }) <= 1 then
    vim.cmd("enew") -- Create new empty buffer first
    vim.cmd("bd #") -- Delete the previous (now becomes #)
  else
    vim.cmd("bd")   -- Just delete current buffer
  end
end)


-- Sync documents
local function is_directory(path)
  local ok, _, code = os.rename(path, path)
  if not ok and code ~= 13 then
    return false
  end
  return true
end

-- Function to generate help tags for plugins with a doc directory
local function generate_helptags()
  local handle = io.popen('ls -1 ' .. plugin_path)
  if not handle then
    print("Failed to read plugins directory.")
    return
  end
  for plugin in handle:lines() do
    local doc_path = plugin_path .. "/" .. plugin .. "/doc"
    if is_directory(doc_path) then
      vim.cmd('helptags ' .. vim.fn.fnameescape(doc_path))
    end
  end
  handle:close()
end
generate_helptags()
