return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    local k = vim.keymap.set
    k({ "n" }, "<A-h>", require('smart-splits').swap_buf_left)
    k({ "n" }, "<A-j>", require('smart-splits').swap_buf_down)
    k({ "n" }, "<A-k>", require('smart-splits').swap_buf_up)
    k({ "n" }, "<A-l>", require('smart-splits').swap_buf_right)
  end
}
