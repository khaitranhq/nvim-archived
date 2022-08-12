local opt = vim.opt

opt.tabstop=2
opt.softtabstop=0
opt.shiftwidth=2
opt.expandtab = true
opt.lazyredraw = true

opt.ignorecase = true
opt.smartcase=true

opt.number=true
opt.relativenumber=true

opt.encoding='UTF-8'
opt.mouse='a'

opt.history=1000
opt.undolevels=1000
opt.clipboard='unnamed,unnamedplus'
opt.autoread = true

-- Move between splitted tabs
vim.api.nvim_set_keymap('', '<c-k>', ':wincmd k<cr>', { noremap = true})
vim.api.nvim_set_keymap('', '<c-j>', ':wincmd j<cr>', { noremap = true})
vim.api.nvim_set_keymap('', '<c-h>', ':wincmd h<cr>', { noremap = true})
vim.api.nvim_set_keymap('', '<c-l>', ':wincmd l<cr>', { noremap = true})

vim.api.nvim_set_keymap('', 'qq', ':qa<cr>', { noremap = true})
vim.g.mapleader = ' '
