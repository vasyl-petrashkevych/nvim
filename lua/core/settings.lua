vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2 
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.o.exrc = true
vim.o.secure = true

--Line numbers
vim.wo.number = true

--use space for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
