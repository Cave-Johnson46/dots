  require('nvim-treesitter').setup {
      ensure_installed = {'lua', 'c', 'markdown', 'bash', 'rust'},
      highlight = { enable = true },
      indent = { enable = true },
    }
