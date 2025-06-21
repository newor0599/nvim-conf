-- Remap
vim.g.mapleader = " "
local k = vim.keymap.set

-- Move between splits
k({ "n" }, "<C-l>", "<C-W><C-l>")
k({ "n" }, "<C-k>", "<C-W><C-k>", { noremap = true })
k({ "n" }, "<C-j>", "<C-W><C-j>")
k({ "n" }, "<C-h>", "<C-W><C-h>")

-- Splits
k({ "n" }, "<leader>vs", "<Cmd>vs<CR>") -- Vertical
k({ "n" }, "<leader>hs", "<Cmd>sp<CR>") -- Horizontal

-- I'm very lazy
k({ "n", "v" }, ";", ":")
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
k('n', '<A-1>', ':BufferGoto 1<CR>')
k('n', '<A-2>', ':BufferGoto 2<CR>')
k('n', '<A-3>', ':BufferGoto 3<CR>')
k('n', '<A-4>', ':BufferGoto 4<CR>')
k('n', '<A-5>', ':BufferGoto 5<CR>')
k('n', '<A-6>', ':BufferGoto 6<CR>')
k('n', '<A-7>', ':BufferGoto 7<CR>')
k('n', '<A-8>', ':BufferGoto 8<CR>')
k('n', '<A-9>', ':BufferGoto 9<CR>')
k('n', '<A-0>', ':BufferLast<CR>')
k('n', '<A-h>', ':BufferPrevious<CR>')
k('n', '<A-l>', ':BufferNext<CR>')
k('n', '<A-<>', ':BufferMovePrevious<CR>')
k('n', '<A->>', ':BufferMoveNext<CR>')
k('n', '<A-P>', ':BufferPin<CR>')
k('n', '<A-x>', ':BufferClose<CR>')

-- Horizontal movement
k('n', 'L', 'zl')
k('n', 'H', 'zh')
