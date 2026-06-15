-- ~/.config/nvim/lua/plugins/debug.lua
return {
	-- 1. The DAP client (core)
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open

		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "󰋇", texthl = "DapStopped", linehl = "", numhl = "" })

		dap.adapters.python = {
			type = "executable",
			command = "python", -- Or the path to your virtual env's python
			args = { "-m", "debugpy.adapter" },
		}

		dap.configurations.python = {
			{
				-- The 'type' must match the adapter name above
				type = "python",
				request = "launch",
				name = "Launch Current File",
				program = "${file}", -- This launches the file you have open
				console = "integratedTerminal",
			},
			{
				type = "python",
				request = "launch",
				name = "Launch with Args",
				program = "${file}",
				args = { "--verbose", "--port", "8080" }, -- Pass arguments to your script
				console = "integratedTerminal",
			},
		}
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.c = {
			{
				name = "Launch Current File",
				type = "codelldb",
				request = "launch",
				program = function()
					-- Compile first
					local file = vim.fn.expand("%:p") -- Full path to current file
					local output = vim.fn.expand("%:r") -- Without extension
					local compile_cmd = string.format("gcc -g %s -o %s", file, output)
					vim.fn.system(compile_cmd)

					-- Return the compiled executable
					return output
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.cpp = dap.configurations.c
		require("mason-nvim-dap").setup({
			ensure_installed = { "python" },
			automatic_setup = true,
		})
	end,
}
