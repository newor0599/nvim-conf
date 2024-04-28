vim.g.mapleader = " "
local k = vim.keymap.set

k("n",";",":")
k({"n","i","v","c"},"<A-q>","<Esc>",{ remap = true})
k("n","<Esc>","<Cmd>noh<CR>")

k('n','<C-l>','<C-W><C-l>')
k('n','<C-k>','<C-W><C-k>')
k('n','<C-j>','<C-W><C-j>')
k('n','<C-h>','<C-W><C-h>')

k('t','<C-x>',"<C-\\><C-n>")
k('n','<leader>x',"<Cmd>bd!<CR>")
