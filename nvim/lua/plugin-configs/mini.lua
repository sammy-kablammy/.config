require('mini.move').setup({
    {
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
            left = '<M-h>',
            right = '<M-l>',
            down = '<M-j>',
            up = '<M-k>',

            -- Move current line in Normal mode
            line_left = '<M-h>',
            line_right = '<M-l>',
            line_down = '<M-j>',
            line_up = '<M-k>',
        },

        -- Options which control moving behavior
        options = {
            -- Automatically reindent selection during linewise vertical move
            reindent_linewise = true,
        },
    }
})

local mini_files = require('mini.files')

mini_files.setup({
    -- Customization of shown content
    content = {
        -- Predicate for which file system entries to show
        filter = nil,
        -- What prefix to show to the left of file system entry
        prefix = nil,
        -- In which order to show file system entries
        sort = nil,
    },

    -- Module mappings created only inside explorer.
    -- Use `''` (empty string) to not create one.
    -- see :h MiniFiles-navigation
    mappings = {
        -- go_in       = 'l',
        go_in       = '<C-l>',
        -- go_in_plus  = 'L',
        go_in_plus  = '<Enter>',
        -- go_out      = 'h',
        go_out      = '<C-h>',
        -- go_out_plus = 'H',
        reset       = '<BS>',
        reveal_cwd  = '@', -- i don't know what this does
        show_help   = 'g?',
        synchronize = '=',
        trim_left   = '<',
        trim_right  = '>',

    },

    -- General options
    options = {
        -- Whether to delete permanently or move into module-specific trash
        permanent_delete = true,
        -- Whether to use for editing directories
        use_as_default_explorer = true,
    },

    -- Customization of explorer windows
    windows = {
        -- Maximum number of windows to show side by side
        max_number = math.huge,
        -- Whether to show preview of file/directory under cursor
        preview = true,
        -- Width of focused window
        width_focus = 30,
        -- Width of non-focused window
        width_nofocus = 15,
        -- Width of preview window
        width_preview = 50,
    },
})

-- you can't make multiple bindings for the same action in the config above, so
-- we need a separate list of bindings down here.
-- https://github.com/echasnovski/mini.nvim/discussions/409
vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
        local map_buf = function(lhs, rhs)
            vim.keymap.set('n', lhs, rhs, { buffer = args.data.buf_id })
        end

        map_buf('<Leader>w', mini_files.synchronize)
        map_buf('-', mini_files.go_out)
        map_buf('q', mini_files.close)
        map_buf('<Esc>', mini_files.close)
        map_buf('<C-c>', mini_files.close)
        map_buf('<C-n>', mini_files.close)

        -- Add extra mappings from *MiniFiles-examples*

        -- open file in a vsplit (why isn't this built in to the plugin?)
        vim.keymap.set('n', '<C-v>', function()
            mini_files.go_in()
            mini_files.close()
            -- TODO assumes vsplit direction is rightward,
            -- also assumes that <C-w>h uses the default binding,
            -- also assumes that the previous buffer is the one you want on the
            -- left
            vim.cmd('vsplit')
            -- pure sorcery is required to do ctrl keys within the :norm command
            vim.cmd([[exe "norm $\<C-w>h"]])
            vim.cmd('bp')
            vim.cmd([[exe "norm $\<C-w>l"]])
        end, { buffer = args.data.buf_id })

    end,
})

-- vim.keymap.set('n', '<C-n>', function() require('mini.fi>es').open(nil, false) end)
vim.keymap.set('n', '<C-n>', function()
    mini_files.open(vim.api.nvim_buf_get_name(0), false)
end)