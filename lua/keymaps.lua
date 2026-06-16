vim.g.mapleader = " "
local k = vim.keymap.set
local lsp_buf = vim.lsp.buf

-- Window manipulations
k({ "n" }, "<C-k>", "<C-W><C-k>", { noremap = true })
k({ "n" }, "<C-l>", "<C-W><C-l>", { noremap = true })
k({ "n" }, "<C-j>", "<C-W><C-j>", { noremap = true })
k({ "n" }, "<C-h>", "<C-W><C-h>", { noremap = true })
k({ "n" }, "<leader>vs", "<Cmd>vs<CR>") -- Vertical
k({ "n" }, "<leader>hs", "<Cmd>sp<CR>") -- Horizontal

-- I'm very lazy
k({ "n", "v" }, ";", ":")
k({ "n", "v" }, "'", '"')
k({ "n", "v" }, "' ", "<Cmd>reg<CR>")
k({ "n" }, "<Esc>", "<Cmd>noh<CR>")
k({ "n" }, "<leader>cf", "<Cmd>lua vim.lsp.buf.format()<CR>")

-- Oil
k({ "n" }, "<leader>e", "<Cmd>Oil<CR>")

-- Terminal
k({ "n" }, "<leader>t", "<Cmd>terminal<CR>")
k({ "t" }, "<C-x>", "<C-\\><C-n>")

-- System clipboard
k({ "n" }, "<A-y>", "\"+Y<Cmd>lua vim.notify('Copied text to clipboard')<CR>")
k({ "v" }, "<A-y>", "\"+y<Cmd>lua vim.notify('Copied text to clipboard')<CR>")
k({ "n" }, "<A-p>", "\"+p<Cmd>lua vim.notify('Pasted text from clipboard')<CR>")
k({ "v" }, "<A-p>", "\"+p<Cmd>lua vim.notify('Pasted text from clipboard')<CR>")
k({ "n" }, "<A-P>", "\"+P<Cmd>lua vim.notify('Pasted text from clipboard')<CR>")
k({ "v" }, "<A-P>", "\"+P<Cmd>lua vim.notify('Pasted text from clipboard')<CR>")

-- Telescope
k({ "n" }, "<C-p>", "<Cmd>Telescope<CR>")

-- Horizontal movement
k("n", "L", "zl")
k("n", "H", "zh")

-- Set up key mappings for LSP features
k("n", "<leader>cd", lsp_buf.definition)
k("n", "<leader>ch", lsp_buf.hover)
k("n", "<leader>ci", lsp_buf.implementation)
k("n", "<leader>cs", lsp_buf.signature_help)
k("n", "<leader>cr", lsp_buf.rename)
k("n", "<leader>cR", lsp_buf.references)
k("n", "<leader>ca", lsp_buf.code_action)

-- DAP
local dap = require("dap")
local dapui = require("dapui")
local function dap_toggle_play_pause()
	local session = dap.session()

	if not session then
		-- No active session: start debugging
		dap.continue()
	elseif session.stopped then
		-- Session exists and is paused: continue/resume
		dap.continue()
	else
		-- Session exists and is running: pause
		dap.pause()
	end
end
k("n", "<leader>d<cr>", dapui.open, { desc = "Debug: Open debug menu" })
k("n", "<leader>dq", dapui.close, { desc = "Debug: Close debug menu" })
--k("n", "<leader>dd", dap.continue, { desc = "Debug: Start/Continue" })
k("n", "<leader>d<leader>", dap_toggle_play_pause, { desc = "Debug: Pause thread" })
k("n", "<leader>D", dap_toggle_play_pause, { desc = "Debug: Pause thread" })
--k("n", "<leader><leader>", dap.step_over, { desc = "Debug: Step Over" })
k("n", "<leader><leader>", dap.step_into, { desc = "Debug: Step Into" })
k("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
k("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
k("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })

-- fzf search
k("n", "<leader>sl", "<Cmd>FzfLua blines<cr>")
k("n", "<leader>sb", "<Cmd>FzfLua buffers<cr>")
k("n", "<leader>su", "<Cmd>FzfLua undotree<cr>")
k("n", "<leader>sr", "<Cmd>FzfLua registers<cr>")
k("n", "<leader>sf", "<Cmd>FzfLua grep_project<cr>")
