-- my config

vim.keymap.set('n', '<leader>s', '<Plug>(leap-forward-to)')

-- from leap's default config
require('leap').setup {
    max_phase_one_targets = nil,
    highlight_unlabeled_phase_one_targets = false,
    max_highlighted_traversal_targets = 10,
    case_sensitive = false,
    equivalence_classes = { ' \t\r\n', },
    substitute_chars = {},
    -- safe_labels = { 's', 'f', 'n', 'u', 't'},
    safe_labels = {'f', 'j', 'd', 'k', 's', 'l'},
    labels = { 's', 'f', 'n', 'j', 'k'},
    special_keys = {
        next_target = '<enter>',
        prev_target = '<tab>',
        next_group = '<space>',
        prev_group = '<tab>',
        multi_accept = '<enter>',
        multi_revert = '<backspace>',
    }
}
