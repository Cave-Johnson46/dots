vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.showmode = false
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300


vim.opt_local.spelllang = "en"
vim.opt_local.spell = true

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.o.scrolloff = 10
vim.o.undofile = true
vim.o.cursorline = true
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

require("config.lazy")

require("config.keybinds")

require("config.lsp")
