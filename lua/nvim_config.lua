-- Line number
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.o.guifont = "Iosevka NFP" -- text below applies for VimScript
vim.g.neovide_cursor_animation_length = 0.15
vim.g.neovide_cursor_trail_size = 0.8
vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_particle_density = 2


-- Folds
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.api.nvim_create_autocmd("BufWinLeave", {
--   pattern = "*",
--   command = "silent! mkview"
-- })

-- I haven't found a suitable fold method for my workflow :(
  --
  --
-- 
-- closes all popups when leaving buffer
local function close_blink_popups_on_leave()
    -- Get all open windows
    local all_wins = vim.api.nvim_list_wins()
    
    for _, win_id in ipairs(all_wins) do
        -- Check if the window is floating/popup
        local win_config = vim.api.nvim_win_get_config(win_id)
        if win_config.relative ~= '' then
            -- Get the buffer associated with this window
            local buf_id = vim.api.nvim_win_get_buf(win_id)
            local buf_name = vim.api.nvim_buf_get_name(buf_id) or ''
            
            -- Close if it's a blink.cmp window (based on buffer name or filetype)
            -- blink.cmp's documentation/signature windows have distinctive names or filetypes
            if buf_name:find('blink') or 
               buf_name:find('cmp') or
               vim.bo[buf_id].filetype == 'markdown' or  -- documentation window filetype
               vim.bo[buf_id].filetype == '' then        -- completion windows often have no filetype
                -- Don't close actual file buffers (they have real file paths)
                if not buf_name:match('^/') or buf_name == '' then
                    pcall(vim.api.nvim_win_close, win_id, false)
                end
            end
        end
    end
end

-- Auto-command to trigger when leaving a window/buffer
vim.api.nvim_create_autocmd("WinLeave", {
    callback = close_blink_popups_on_leave,
    desc = "Close blink.cmp popups when leaving buffer",
})

-- Textwrap
vim.cmd("set nowrap")

vim.cmd("TSEnable highlight")

-- Tab to spaces
vim.opt.tabstop = 2      -- Tab key inserts 2 spaces
vim.opt.shiftwidth = 2   -- Indent is 2 spaces
vim.opt.expandtab = true -- Convert tabs to spaces

-- GUI
vim.o.winborder = "rounded"
vim.cmd('colorscheme duckbones')

-- Close buffer but ensure Neovim stays open with an empty buffer
vim.keymap.set("n", "<leader>x", function()
  if #vim.fn.getbufinfo({ buflisted = 1 }) <= 1 then
    vim.cmd("enew") -- Create new empty buffer first
    vim.cmd("bd #") -- Delete the previous (now becomes #)
  else
    vim.cmd("bd")   -- Just delete current buffer
  end
end)

vim.api.nvim_set_hl(0, "@string", { fg = "#98B06F" })
vim.api.nvim_set_hl(0, "@type", { fg = "#797596" })
vim.api.nvim_set_hl(0, "@variable", { fg = "#F2A359" })
vim.api.nvim_set_hl(0, "@function", { fg = "#D33F49" })
