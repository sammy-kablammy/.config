if vim.g.vscode then
    -- VSCode extension
    print("vscode neovim detected!")
else
    -- ordinary Neovim
    print("no running vscode instance detected!")
    require("core.install-packer")
    require("all-my-plugin-configs")
end

require("core.keymaps")
require("core.misc-vim-stuff")
