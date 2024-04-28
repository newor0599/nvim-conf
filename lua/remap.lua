vim.g.mapleader = " "
k = vim.keymap.set

k("n",";",":")
k({"n","i","v","c"},"<A-q>","<Esc>",{ remap = true})
k("n","<Esc>","<Cmd>noh<CR>")
