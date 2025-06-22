return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
	require("nvim-tree").setup({
	    vim.keymap.set("n","<leader>e","<Cmd>NvimTreeFocus<CR>"),
	    update_cwd = true,
	    git = {
		enable = true,
		ignore = false,
	    },
	    renderer = {
		highlight_git = true,
		indent_markers = {
		    enable = true
		},
		icons = {
		    glyphs = {
			git = {
			    unstaged = "",
			    staged = "",
			    unmerged = "",
			    renamed = "󰓹",
			    untracked = "󱥸",
			    deleted = "",
			    ignored = "",
			}
		    }
		}
	    }
	})
	vim.api.nvim_create_autocmd({"QuitPre"}, {
	    callback = function() vim.cmd("NvimTreeClose") end,
	})
    end
}
