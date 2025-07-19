-- Remap
vim.g.mapleader = " "
local k = vim.keymap.set

-- Window manipulations
k({ "n" }, "<C-l>", "<C-W><C-l>")
k({ "n" }, "<C-k>", "<C-W><C-k>", { noremap = true })
k({ "n" }, "<C-j>", "<C-W><C-j>")
k({ "n" }, "<C-h>", "<C-W><C-h>")
k({ "n" }, "<leader>vs", "<Cmd>vs<CR>") -- Vertical
k({ "n" }, "<leader>hs", "<Cmd>sp<CR>") -- Horizontal

-- I'm very lazy
k({ "n", "v" }, ";", ":")
k({ "n", "v" }, "'", "\"")
k({ "n" }, "''", "<Cmd>reg<CR>")
k({ "n" }, "<Esc>", "<Cmd>noh<CR>")

-- Oil
k({ "n" }, "<leader>e", ":Oil<CR>")

-- Terminal
k({ "n" }, "<leader>t", ":terminal<CR>")
k({ "n", "t" }, "<C-x>", "<C-\\><C-n>")

-- System clipboard
k({ 'n' }, "<A-y>", '"+Y:lua vim.notify(\'Copied text to clipboard\')<CR>')
k({ 'v' }, "<A-y>", '"+y:lua vim.notify(\'Copied text to clipboard\')<CR>')
k({ 'n' }, "<A-p>", '"+P:lua vim.notify(\'Pasted text from clipboard\')<CR>')
k({ 'v' }, "<A-p>", '"+p:lua vim.notify(\'Pasted text from clipboard\')<CR>')

-- Telescope
k({ 'n' }, "<C-p>", ':Telescope<CR>')

-- BarBar
k('n', '<A-1>', ':BufferGoto 1<CR>', { silent = true })
k('n', '<A-2>', ':BufferGoto 2<CR>', { silent = true })
k('n', '<A-3>', ':BufferGoto 3<CR>', { silent = true })
k('n', '<A-4>', ':BufferGoto 4<CR>', { silent = true })
k('n', '<A-5>', ':BufferGoto 5<CR>', { silent = true })
k('n', '<A-6>', ':BufferGoto 6<CR>', { silent = true })
k('n', '<A-7>', ':BufferGoto 7<CR>', { silent = true })
k('n', '<A-8>', ':BufferGoto 8<CR>', { silent = true })
k('n', '<A-9>', ':BufferGoto 9<CR>', { silent = true })
k('n', '<A-0>', ':BufferLast<CR>', { silent = true })
k('n', '<A-[>', ':BufferPrevious<CR>', { silent = true })
k('n', '<A-]>', ':BufferNext<CR>', { silent = true })
k('n', '<A-<>', ':BufferMovePrevious<CR>', { silent = true })
k('n', '<A->>', ':BufferMoveNext<CR>', { silent = true })
k('n', '<A-P>', ':BufferPin<CR>', { silent = true })
k('n', '<A-x>', ':BufferClose<CR>', { silent = true })

-- Horizontal movement
k('n', 'L', 'zl')
k('n', 'H', 'zh')
