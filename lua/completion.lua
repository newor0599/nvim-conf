local blink = require 'blink.cmp'
blink.setup({
    keymap = {
        preset = 'default',
        ['<C-j>'] = { 'select_next' },
        ['<C-k>'] = { 'select_prev' },
        ['<C-S-k>'] = { 'scroll_documentation_up' },
        ['<C-S-j>'] = { 'scroll_documentation_down' },
        ['<C-Space>'] = { 'show_and_insert', 'show_documentation', 'show_signature' },
    },
    appearance = {
        nerd_font_variant = 'mono',
        use_nvim_cmp_as_default = true
    },
    completion = {
        documentation = {
            auto_show = false,
            window = { border = 'rounded' }
        },
        accept = {
            auto_brackets = {
                enabled = true
            }
        },
        menu = {
            border = 'rounded',
            draw = {

            }
        },
        --ghost_text = { enabled = true }
    },
    sources = { default = { 'lsp', 'buffer', 'path' } },
    fuzzy = { implementation = "lua" }
})
