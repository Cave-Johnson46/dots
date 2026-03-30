vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true
vim.o.relativenumber = true

vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)


vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")



require("config.lazy")

require("config.treesitter")

require("config.keybinds")
