local icon_picker = require('icon-picker')
icon_picker.setup {
    disable_legacy_commands = true,
}

vim.keymap.set('i', '<C-k>', '<esc><cmd>IconPickerInsert<cr>')
