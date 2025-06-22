return {
  {"neovim/nvim-lspconfig"},
  -- Autopair
  {
    "altermo/ultimate-autopair.nvim",
    opts = {
      fastwarp = {
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

      close = {
        enable = true,
        map = '<A-S-0>', --string or table
        cmap = '<A-)>',  --string or table
        conf = {},
        multi = false,
        do_nothing_if_fail = true,
      }
    }
  },
  {
    "https://github.com/Saghen/blink.cmp",
    opts={
      keymap = {
        preset = 'default',
        ['<C-j>'] = { 'select_next' },
        ['<C-k>'] = { 'select_prev' },
        ['<C-S-k>'] = { 'scroll_documentation_up' },
        ['<C-S-j>'] = { 'scroll_documentation_down' },
        ['<C-Space>'] = { 'show_documentation', 'show_signature' },
        ['<C-a>'] = { 'show_and_insert' }
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
    }
  }
}
