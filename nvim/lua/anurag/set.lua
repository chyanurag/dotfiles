local vo = vim.opt

vo.guicursor = ""
vim.g.netrw_banner = 0
vim.g.netrw_liststyle=3

vo.mouse = 'a'

vim.g.mapleader = " "

vo.number = true
vo.relativenumber = true

vo.tabstop = 4
vo.softtabstop = 4
vo.shiftwidth = 4
vo.expandtab = true

vo.smartindent = true

vo.wrap = false

vo.swapfile = false
vo.backup = false
vo.undofile = true

vo.hlsearch = false
vo.incsearch = true

vo.termguicolors = true
vo.background = "dark"

vo.scrolloff = 8
vo.signcolumn = "auto"

vim.g.mapleader = " "

vim.opt.syntax = "on"

vo.ignorecase = true

vo.path:append { '**' }
vo.wildignore:append { '*/node_modules/*' }

vo.compatible = false

vim.cmd('filetype plugin on')
