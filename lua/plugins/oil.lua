return {
  "stevearc/oil.nvim",
  dependencies = { { "echasnovski/mini.icons", lazy = true, opts = {} } },
  lazy = false,
  opts = {
    use_default_keymaps = false,
    keymaps = {
      ["?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      ["L"] = "actions.select",
      ["q"] = { "actions.close", mode = "n" },
      ["H"] = { "actions.parent", mode = "n" },
      ["c"] = { "actions.open_cwd", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["s"] = { "actions.change_sort", mode = "n" },
    },

    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
      -- Can be "fast", true, or false. "fast" will turn it off for large directories.
      natural_order = "fast",
      -- Sort file and directory names case insensitive
      case_insensitive = false,
      sort = {
        -- sort order can be "asc" or "desc"
        -- see :help oil-columns to see which columns are sortable
        { "type", "asc" },
        { "name", "asc" },
      },
    }
  }
}
