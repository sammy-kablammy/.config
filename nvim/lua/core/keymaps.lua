-- this file contains all my keymaps

-- <leader> needs to be set up in init.lua, right before setting up lazy!

-- if some keys aren't working, see :h :map-special-keys

local keymap = vim.keymap.set

keymap('n', '<leader>li', '<cmd>LspInfo<cr>')

-- remove annoying mappings
keymap('n', '<c-f>', '')
keymap('i', '<c-a>', '')

-- toggle 'clear search'
keymap('n', '<leader>cs', '<cmd>set hls!<cr>')

-- movement should work how you expect even if a line is really long
keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')
-- keymap('n', '0', 'g0')
-- keymap('n', '$', 'g$')
-- keymap('n', '^', 'g^')

-- easier navigation between windows
keymap('n', '<c-h>', '<c-w>h')
keymap('n', '<c-j>', '<c-w>j')
keymap('n', '<c-k>', '<c-w>k')
keymap('n', '<c-l>', '<c-w>l')

-- only
keymap('n', '<leader>o', '<cmd>only<cr>')

-- scroll up and down without getting disoriented
keymap('n', '<c-d>', '<c-d>zz')
keymap('n', '<c-u>', '<c-u>zz')

-- easily open my help files & config
keymap('n', '<leader>ni', '<cmd>vsplit ~/.config/nvim/init.lua<cr>')
keymap('n', '<leader>nk', '<cmd>vsplit ~/.config/nvim/lua/core/keymaps.lua<cr>')
keymap('n', '<leader>nm', '<cmd>vsplit ~/.config/nvim/lua/core/misc-vim-stuff.lua<cr>')
keymap('n', '<leader>hv', '<cmd>vsplit ~/.config/quick_reference/vim_quick_reference.md<cr>')
keymap('n', '<leader>hn', '<cmd>vsplit ~/.config/quick_reference/neovim_quick_reference.md<cr>')
keymap('n', '<leader>hb', '<cmd>vsplit ~/.config/quick_reference/bash_quick_reference.md<cr>')
keymap('n', '<leader>ht', '<cmd>vsplit ~/.config/quick_reference/tmux_quick_reference.md<cr>')
keymap('n', '<leader>hg', '<cmd>vsplit ~/.config/quick_reference/git_quick_reference.md<cr>')

-- alternate file
keymap('n', '<Tab>', '<c-^>')

-- buffer stuff
keymap('n', '<leader>bb', '<cmd>buffers<cr>')
keymap('n', '<leader>bn', '<cmd>bn<cr>')
keymap('n', '<leader>bp', '<cmd>bp<cr>')
keymap('n', '<leader>bq', '<cmd>bd<cr>')
keymap('n', '<leader>bQ', '<cmd>bd!<cr>')
keymap('n', '<leader>bd', '<cmd>bd<cr>')
keymap('n', '<leader>bD', '<cmd>bd!<cr>')

-- tab stuff
keymap('n', '<leader>te', '<cmd>tabe<cr>')
keymap('n', '<leader>tq', '<cmd>tabclose<cr>')
keymap('n', '<leader>tn', '<cmd>tabnext<cr>')
keymap('n', '<leader>tp', '<cmd>tabprevious<cr>')
keymap('n', '<leader>tt', '<cmd>tabs<cr>')

-- more remaps
keymap('n', '<leader>w', '<cmd>w<cr>')
keymap('n', '<leader>ed', '<cmd>edit<cr>')
keymap('n', '<leader>so', function()
    vim.cmd('source')
    print('sourced!')
end)

-- quickfix list
keymap('n', '<leader>co', '<cmd>copen<cr>')
keymap('n', '<leader>cq', '<cmd>cclose<cr>')
keymap('n', '<leader>cf', '<cmd>cfirst<cr>')
keymap('n', '<leader>cl', '<cmd>clast<cr>')
keymap('n', '<leader>cn', '<cmd>cn<cr>')
keymap('n', '<leader>cp', '<cmd>cp<cr>')
keymap('n', ']t', '<cmd>cn<cr>')
keymap('n', '[t', '<cmd>cp<cr>')

-- "change inside ___" motions but reversed
keymap('n', 'cr"', '?"<cr><cmd>nohlsearch<cr>ci"')
keymap('n', "cr'", "?'<cr><cmd>nohlsearch<cr>ci'")
keymap('n', 'cr`', '?`<cr><cmd>nohlsearch<cr>ci`')
keymap('n', 'cr(', '?(<cr><cmd>nohlsearch<cr>ci(')
keymap('n', 'cr[', '?[<cr><cmd>nohlsearch<cr>ci[')
keymap('n', 'cr{', '?{<cr><cmd>nohlsearch<cr>ci{')
keymap('n', 'cr<', '?<<cr><cmd>nohlsearch<cr>ci<')

-- add argument to function
keymap('n', '<leader>a', '$F)i, ')

-- put markdown headings into the quickfix list for easy navigation
keymap('n', 'md', '<cmd>vimgrep /^\\#/ %<cr><cmd>copen<cr>')

-- navigate between git merge conflict markers (do i use this?)
-- keymap('n', '[g', '?<<<<<<<<cr>')
-- keymap('n', ']g', '/<<<<<<<<cr>')
