return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
      ensure_installed = {'lua', 'c', 'markdown', 'markdown_inline', 'bash', 'rust'},
      highlight = { enable = true },
      indent = { enable = true },
  }
}
