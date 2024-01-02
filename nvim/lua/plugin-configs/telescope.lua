local builtin = require('telescope.builtin')

-- you can use 'builtin.builtin' to find builtin pickers

local function map(lhs, rhs, desc)
    if desc then
        vim.keymap.set('n', '<leader>f' .. lhs, rhs, { desc = desc })
    else
        vim.keymap.set('n', '<leader>f' .. lhs, rhs, {})
    end
end

-- roughly in order of how much i use them

map('f', builtin.find_files, 'find files')
map('h', builtin.help_tags, 'help')
map('b', builtin.buffers, 'buffers')
map('g', builtin.live_grep, 'live grep')
map('o', builtin.oldfiles, 'old files')
map('q', builtin.quickfix, 'quickfix list')
map('l', builtin.loclist, 'local list')
map('m', builtin.diagnostics, 'diagnostics')
map('ch', builtin.command_history, 'command history')
map('p', builtin.planets, 'planets') -- lol

-- map('c', builtin.current_buffer_fuzzy_find, 'current buffer')
-- map('v', builtin.vim_options, '')
-- map('r', builtin.lsp_references, '')
-- map('t', builtin.treesitter, 'treesitter identifiers')
-- map('m', builtin.man_pages, '')
-- map('gi', builtin.git_commits, 'git commits')
-- map('gs', builtin.git_status, 'git status')

map('n', function()
    builtin.find_files({
        search_dirs = {
            '~/.config/quick_reference/',
            '~/.config/langs'
        }
    })
end, 'notes')
