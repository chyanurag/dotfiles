return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require 'telescope'.setup {
            defaults = {
                file_ignore_patterns = {
                    "node_modules"
                }
            }
        }
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
    end
}

