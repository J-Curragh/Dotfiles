vim.g.mapleader = " "

vim.opt.tabstop = 2 
vim.opt.softtabstop = 2 
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd([[
    set clipboard=unnamedplus
]])

vim.cmd([[
    let g:seoul256_background = 234
    colorscheme seoul256 
]])

