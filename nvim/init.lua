-- alias to pretty print
function P(args)
    vim.print(args)
end

function fmt()
    vim.lsp.buf.format()
end

if vim.g.vscode then
    print("👀 hello vscoders")
    vim.keymap.set('n', 'j', 'gj')
    vim.keymap.set('n', 'k', 'gk')
    require("core.misc-vim-stuff")
else
    print("👀 hello neovimmers")

    -- Lazy.nvim bootstrap
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

    require("lazy").setup({
        -- pretty important plugins. in no particular order.
        -- these are used all the time.
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000
        },
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.3',
            -- or                              , branch = '0.1.x',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {
            -- { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- LSP Support
            {
                'neovim/nvim-lspconfig',
                dependencies = {
                    { 'hrsh7th/cmp-nvim-lsp' },
                },
            },
            -- Autocompletion
            {
                'hrsh7th/nvim-cmp',
                dependencies = {
                    { 'L3MON4D3/LuaSnip' },
                }
            }
        },
        -- {
        --     'stevearc/conform.nvim',
        --     opts = {},
        -- },
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            opts = {} -- this is equalent to setup({}) function
        },
        'nvim-lualine/lualine.nvim',
        'numToStr/Comment.nvim',
        'nvim-treesitter/nvim-treesitter',
        'lewis6991/gitsigns.nvim',
        'folke/neodev.nvim',
        {
            'nvimtools/none-ls.nvim',
            config = function()
                local null_ls = require("null-ls")
                null_ls.setup({
                    -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
                    sources = {
                        null_ls.builtins.code_actions.eslint_d,
                        null_ls.builtins.formatting.prettierd, -- does md too!
                        null_ls.builtins.formatting.clang_format,
                        null_ls.builtins.formatting.black,

                        -- null_ls.builtins.formatting.stylua, -- no
                    },
                })
            end
        },

        -- ##### NEW SNIPPET STUFF
        {
            {
                "L3MON4D3/LuaSnip",
                lazy = false,
                dependencies = {
                    "rafamadriz/friendly-snippets",
                    "saadparwaiz1/cmp_luasnip",
                },
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
            {
                "hrsh7th/cmp-nvim-lsp",
                lazy = false,
                config = true,
            },
            {
                "hrsh7th/nvim-cmp",
                lazy = false,
                config = function()
                    local cmp = require("cmp")
                    local ls = require('luasnip')
                    cmp.setup({
                        window = {
                            documentation = cmp.config.window.bordered(),
                            -- completion = cmp.config.window.bordered(),
                        },
                        snippet = {
                            expand = function(args)
                                ls.lsp_expand(args.body)
                            end,
                        },
                        mapping = cmp.mapping.preset.insert({
                            -- (C-n triggers the completion menu)
                            ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                            ["<C-e>"] = cmp.mapping.abort(),
                            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                            ["<C-d>"] = cmp.mapping.scroll_docs(4),
                            -- what is this supposed to do
                            -- ["<C-y>"] = cmp.mapping.complete(),
                        }),
                        sources = cmp.config.sources({
                            { name = "nvim_lsp" },
                            { name = "luasnip" },
                        }, {
                            { name = "buffer" },
                        }),
                    })
                end,
            },
        },
        -- ##### okay that's the new snippet stuff

        -- less important plugins. these might be specific to a single language.
        -- or maybe they are plugins i'm trying to get away from/rewrite myself.
        -- {
        --     "nvim-tree/nvim-tree.lua",
        --     dependencies = {
        --         'nvim-lua/plenary.nvim',
        --         'nvim-tree/nvim-web-devicons'
        --     },
        -- },
        {
            "folke/which-key.nvim",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 500
            end
        },
        {
            'akinsho/bufferline.nvim',
            version = "*",
            dependencies = 'nvim-tree/nvim-web-devicons'
        },
        {
            'ziontee113/icon-picker.nvim',
            dependencies = {
                'stevearc/dressing.nvim'
            },
        },
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2", -- TODO check back when harpoon2 is finished
            dependencies = {
                "nvim-lua/plenary.nvim",
                'nvim-telescope/telescope.nvim',
            }
        },
        'folke/todo-comments.nvim',
        'ThePrimeagen/vim-be-good',
        'simrat39/rust-tools.nvim',
        'jbyuki/nabla.nvim',
        { 'echasnovski/mini.nvim', version = '*' },

        -- my custom plugins
        'sammy-kablammy/nvim_plugin_template',
        {
            'sammy-kablammy/simpletodo.nvim',
            init = function()
                require 'simpletodo'.setup {}
            end
        },
        -- { dir = '~/my_neovim_plugins/showcase.nvim' },
        -- { dir = '~/my_neovim_plugins/simpletodo.nvim' },
    })

    -- ...and these are my config files :)
    require("plugin-configs")
    require("core.keymaps")
    require("core.misc-vim-stuff")
    require("core.abbreviations")
end
