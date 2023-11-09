-- this file contains all my keymaps

-- [mapleader needs to be set in init.lua, right before lazy]

-- remove "ctrl-a" because it's really annoying why would i ever want to use it why why why
vim.keymap.set('i', '<c-a>', '')

-- 'clear search'
vim.keymap.set('n', '<leader>cs', '<cmd>noh<cr>')

-- up/down should work how you expect even if a line is really long
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- easier navigation between windows
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- scroll up and down without getting disoriented
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

-- easily open my help files
vim.keymap.set('n', '<leader>hv', '<cmd>vsplit ~/.config/quick_reference/vim_quick_reference.md<cr>')
vim.keymap.set('n', '<leader>hn', '<cmd>vsplit ~/.config/quick_reference/neovim_quick_reference.md<cr>')
vim.keymap.set('n', '<leader>hb', '<cmd>vsplit ~/.config/quick_reference/bash_quick_reference.md<cr>')
vim.keymap.set('n', '<leader>ht', '<cmd>vsplit ~/.config/quick_reference/tmux_quick_reference.md<cr>')
vim.keymap.set('n', '<leader>hg', '<cmd>vsplit ~/.config/quick_reference/git_quick_reference.md<cr>')

-- Buffer stuff
-- :( can't use tab because it thinks it's ctrl+i
-- vim.keymap.set('n', '<tab>', '<cmd>bn<cr>')
vim.keymap.set('n', '<leader><tab>', '<cmd>bn<cr>')
vim.keymap.set('n', '<leader>bb', '<cmd>buffers<cr>')
vim.keymap.set('n', '<leader>bn', '<cmd>bn<cr>')
vim.keymap.set('n', '<leader>bp', '<cmd>bp<cr>')
vim.keymap.set('n', '<leader>bq', '<cmd>bd<cr>')
vim.keymap.set('n', '<leader>bQ', '<cmd>bd!<cr>')
vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>')
vim.keymap.set('n', '<leader>bD', '<cmd>bd!<cr>')

-- tab stuff
vim.keymap.set('n', '<leader>te', '<cmd>tabe<cr>')
vim.keymap.set('n', '<leader>tq', '<cmd>tabclose<cr>')
vim.keymap.set('n', '<leader>tn', '<cmd>tabnext<cr>')
vim.keymap.set('n', '<leader>tp', '<cmd>tabprevious<cr>')
vim.keymap.set('n', '<leader>tt', '<cmd>tabs<cr>')

-- more remaps
vim.keymap.set('n', '<leader>w', '<cmd>:w<cr>')
vim.keymap.set('n', '<leader>e', '<cmd>:edit<cr>')

-- quickfix list
vim.keymap.set('n', '<leader>co', '<cmd>:copen<cr>')
vim.keymap.set('n', '<leader>cq', '<cmd>:cclose<cr>')
vim.keymap.set('n', '<leader>cn', '<cmd>:cn<cr>')
vim.keymap.set('n', '<leader>cp', '<cmd>:cp<cr>')
vim.keymap.set('n', '<leader>cf', '<cmd>:cfirst<cr>')
vim.keymap.set('n', '<leader>cl', '<cmd>:clast<cr>')

-- TODO disable :cq and other annoying quit commands
-- TODO consider finding a use for alt+hjkl
