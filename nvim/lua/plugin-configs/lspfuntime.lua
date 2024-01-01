-- trying to do this on my own now. no more lsp-zero training wheels.
-- this file is an amalgamation of lspconfig's guide and lsp-zero's guide

local my_servers = {
    -- LSPs that buckle my shoe
    'lua_ls',
    'tsserver',
    'biome',
    'jdtls',
    'pyright',
    'clangd',

    -- don't really need these but i'll keep em around
    'rust_analyzer',
    'dockerls',

    -- 'ltex', -- no
    -- 'remark_ls', no
}

-- Mason needs to be setup before your language servers
require('mason').setup {}
require('mason-lspconfig').setup {
    ensure_installed = my_servers
}

-- ***** modified from lspconfig's setup guide *****

local lspconfig = require('lspconfig')

for _, server in ipairs(my_servers) do
    lspconfig[server].setup {}
end

-- Global mappings.
-- TODO read this
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>m', vim.diagnostic.setloclist, {
    desc = 'populate loclist from LSP'
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- i have no idea what this does 💀
        -- Enable completion triggered by <c-x><c-o>
        -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- TODO read this
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<f2>', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<f3>', function()
            vim.lsp.buf.format { async = true }
        end, opts)
        -- vim.keymap.set('n', '<f3>', vim.lsp.buf.format)

        print("LSP successfully attached 😊")
    end,
})

-- ***** modified from lsp-zero's "you might not need LSP zero" guide *****
local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        -- Enter key confirms completion item
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),

        ['<C-l>'] = cmp.mapping.select_next_item({}),
        ['<C-h>'] = cmp.mapping.select_prev_item({}),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        -- Ctrl + space triggers completion menu
        -- THIS CONFLICTS WITH TMUX :( USE <prefix>C-b to bypass
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})


-- luasnip configurin'

-- i don't know how to fully configure luasnips, but this is an example snippet.
-- it only snippetifies itself if you press the hotkey (<c-k>). it doesn't
-- appear in the autocompletion menu as of right now. :(
-- i haven't yet gotten it to import vscode snippets
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
ls.add_snippets('lua', {
    s('sample', t('-- this is a sample snippet'))
})


-- friendly-snippets configuration
require("luasnip.loaders.from_vscode").lazy_load()


-- conform.nvim configuration
-- require("conform").setup({
--     formatters_by_ft = {
--         lua = { "stylua" },
--         -- Conform will run multiple formatters sequentially
--         python = { "isort", "black" },
--         -- Use a sub-list to run only the first available formatter
--         javascript = { { "prettierd", "prettier" } },
--         java = { "google-java-format" },
--         markdown = { "mdformat" }
--     },
-- })
--
-- vim.keymap.set('n', '<F3>', require 'conform'.format)
