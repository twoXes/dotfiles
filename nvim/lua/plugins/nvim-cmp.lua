return {
    
    "hrsh7th/nvim-cmp",
    dependencies = {
      {"neovim/nvim-lspconfig"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"hrsh7th/cmp-cmdline"},
      {"hrsh7th/cmp-vsnip"},
      {"hrsh7th/vim-vsnip"}
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup{
        snippet = {
            expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users
        end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
        sources = { 
            { name = 'nvim_lsp' }, { name = 'vsnip' }, 
            { name = 'buffer',
              option = {
                get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end}   
            }, { name = 'path' } 
            },
    
        }
    end

}
