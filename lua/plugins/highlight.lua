return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = { 'lua', 'python', 'html', 'cpp', 'bash' },
    highlight = { enable = true }
  }
}
