local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>hpp", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>hpl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>hpa", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>hpr", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>hps", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>hpt", function() harpoon:list():select(4) end)
