-- return
return {
  "stevearc/oil.nvim",
  dependencies = { { "echasnovski/mini.icons", lazy = false, opts = {} } },
  lazy = false,
  opts = {
    use_default_keymaps = false,
    keymaps = {
      ["?"] = { "actions.show_help", mode = "n" },
      ["L"] = { "actions.select", mode = 'n' },
      ["<CR>"] = { "actions.select", mode = 'n' },
      ["q"] = { "actions.close", mode = "n" },
      ["H"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["s"] = { "actions.change_sort", mode = "n" },
    },

    view_options = {
      show_hidden = true,
      natural_order = "fast",
      case_insensitive = false,
      sort = {
        { "type", "asc" },
        { "name", "asc" },
      },
    }
  }
}
