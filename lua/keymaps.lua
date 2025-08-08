-- Remap
vim.g.mapleader = " "
local k = vim.keymap.set

-- Window manipulations
k({ "n" }, "<C-k>", "<C-W><C-k>", { noremap = true })
k({ "n" }, "<C-l>", "<C-W><C-l>", { noremap = true })
k({ "n" }, "<C-j>", "<C-W><C-j>", { noremap = true })
k({ "n" }, "<C-h>", "<C-W><C-h>", { noremap = true })
k({ "n" }, "<leader>vs", "<Cmd>vs<CR>") -- Vertical
k({ "n" }, "<leader>hs", "<Cmd>sp<CR>") -- Horizontal

-- I'm very lazy
k({ "n", "v" }, ";", ":")
k({ "n", "v" }, "'", "\"")
k({ "n", "v" }, "' ", "<Cmd>reg<CR>")
k({ "n" }, "<Esc>", "<Cmd>noh<CR>")

-- Oil
k({ "n" }, "<leader>e", "<Cmd>Oil<CR>")

-- Terminal
k({ "n" }, "<leader>t", "<Cmd>terminal<CR>")
k({ "n", "t" }, "<C-x>", "<C-\\><C-n>")

-- System clipboard
k({ 'n' }, "<A-y>", '"+Y<Cmd>lua vim.notify(\'Copied text to clipboard\')<CR>')
k({ 'v' }, "<A-y>", '"+y<Cmd>lua vim.notify(\'Copied text to clipboard\')<CR>')
k({ 'n' }, "<A-p>", '"+P<Cmd>lua vim.notify(\'Pasted text from clipboard\')<CR>')
k({ 'v' }, "<A-p>", '"+p<Cmd>lua vim.notify(\'Pasted text from clipboard\')<CR>')

-- Telescope
k({ 'n' }, "<C-p>", '<Cmd>Telescope<CR>')

-- Horizontal movement
k('n', 'L', 'zl')
k('n', 'H', 'zh')
