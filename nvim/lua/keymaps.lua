local keymap = vim.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap.set('n', '<leader>p', vim.cmd.Ex)
keymap.set('n', '<leader>s', vim.cmd.write)
keymap.set('n', '<leader>q', vim.cmd.quit)
