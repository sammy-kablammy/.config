-- alias to pretty print
function P(args)
    vim.print(args)
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
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-tree/nvim-web-devicons'
            },
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
        {
            "folke/which-key.nvim",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 500
            end
        },
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000
        },
        {
            'akinsho/bufferline.nvim',
            version = "*",
            dependencies = 'nvim-tree/nvim-web-devicons'
        },
        'nvim-lualine/lualine.nvim',
        'nvim-treesitter/nvim-treesitter',
        "folke/neodev.nvim",
        'numToStr/Comment.nvim',
        'folke/todo-comments.nvim',
        'lewis6991/gitsigns.nvim',
        'ThePrimeagen/vim-be-good',
        'simrat39/rust-tools.nvim',

        -- my custom plugins
        'sammy-kablammy/nvim_plugin_template',

    })

    -- ...and these are my config files :)
    require("plugin-configs")
    require("core.keymaps")
    require("core.misc-vim-stuff")
    require("core.abbreviations")
end
