return {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    config = function()
        require("toggleterm").setup()
        vim.keymap.set('n', '<C-t>', vim.cmd.ToggleTerm)
    end
}
