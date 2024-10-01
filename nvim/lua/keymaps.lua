local keymap = vim.keymap

vim.g.mapleader = ' '
keymap.set('n', '<leader>s', vim.cmd.write)
keymap.set('n', '<leader>q', vim.cmd.quit)
keymap.set('n', '<leader>p', vim.cmd.Ex)
