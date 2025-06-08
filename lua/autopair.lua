require 'ultimate-autopair'.setup({})
---@diagnostic disable-next-line: missing-fields
require('nvim-ts-autotag').setup({
    opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true
    },
    per_filetype = {
        ["html"] = {
            enable_close = true
        }
    }
})
