require 'ultimate-autopair'.setup({
    fastwarp = { -- *ultimate-autopair-map-fastwarp-config*
        enable = true,
        enable_normal = true,
        enable_reverse = true,
        hopout = false,
        map = '<A-.>',   --string or table
        rmap = '<A-,>',  --string or table
        cmap = '<A-.>',  --string or table
        rcmap = '<A-,>', --string or table
        multiline = true,
        nocursormove = true,
    },

    close = {            -- *ultimate-autopair-map-close-config*
        enable = true,
        map = '<A-S-0>', --string or table
        cmap = '<A-)>',  --string or table
        conf = {},
        --contains extension config
        multi = false,
        --use multiple configs (|ultimate-autopair-map-multi-config|)
        do_nothing_if_fail = true,
    }
})
--[[
@diagnostic disable-next-line: missing-fields
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
    },
})
--]]
