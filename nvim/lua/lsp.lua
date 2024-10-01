vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = {buffer = event.buf}
        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<leader>c', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>rr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    end,
})
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup {}
lspconfig.rust_analyzer.setup {}
cmp.setup({
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},  
        {name = 'luasnip'},  
    }, {
            {name = 'buffer'},
        }),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})
local luasnip = require("luasnip")
luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })
require("luasnip.loaders.from_vscode").lazy_load()
