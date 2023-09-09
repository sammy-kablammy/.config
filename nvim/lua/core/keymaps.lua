-- this file contains all my keymaps

vim.g.mapleader = ' '

-- quick :source command to reload stuff quickly while configuring
-- vim.keymap.set('n', '<leader>s', ':source<cr>')

-- easier navigation between windows
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- easily open my help files
vim.keymap.set('n','<leader>hv', '<cmd>vsplit ~/.config/quick_reference/vim_quick_reference.md<cr>')
vim.keymap.set('n', '<leader>hn', '<cmd>vsplit ~/.config/quick_reference/neovim_quick_reference.md<cr>')
vim.keymap.set('n', '<leader>hb', '<cmd>vsplit ~/.config/quick_reference/bash_quick_reference.md<cr>')
vim.keymap.set('n', '<leader>ht', '<cmd>vsplit ~/.config/quick_reference/tmux_quick_reference.md<cr>')
vim.keymap.set('n', '<leader>hg', '<cmd>vsplit ~/.config/quick_reference/git_quick_reference.md<cr>')

-- Buffer stuff
vim.keymap.set('n', '<leader><tab>', '<cmd>bn<cr>')
vim.keymap.set('n', '<leader>bq', '<cmd>bd<cr>')
vim.keymap.set('n', '<leader>bn', '<cmd>bn<cr>')
vim.keymap.set('n', '<leader>bp', '<cmd>bp<cr>')

-- Save file remaps
vim.keymap.set('n', 'ZW', '<cmd>:w<cr>')
vim.keymap.set('n', '<leader>w', '<cmd>:w<cr>')

-- move lines up and down, from theprimeagen
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- TODO consider finding a use for alt+hjkl
