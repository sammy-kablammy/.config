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
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            "neovim/nvim-lspconfig",
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
        }
    },
    {
        "folke/which-key.nvim",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    'nvim-lualine/lualine.nvim',
    'nvim-treesitter/nvim-treesitter',
    "folke/neodev.nvim",
    'numToStr/Comment.nvim',
    'folke/todo-comments.nvim',
    'lewis6991/gitsigns.nvim',
    'ThePrimeagen/vim-be-good',
})

-- ...and these are my config files :)
require("plugin-configs")
require("core.keymaps")
require("core.misc-vim-stuff")
