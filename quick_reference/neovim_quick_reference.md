# NEOVIM QUICK REFERENCE

---

# Install neovim
The apt version of neovim is super out of date. Use the appimage instead.
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
mv nvim.appimage nvim
chmod u+x nvim
mv nvim /usr/bin
```

If the appimage doesn't work, you'll have to build from source.
Not too complicated - just follow the instructions on the neovim github, making sure
to consider installing it in the way that allows for uninstalling.

# Windows installation
The default location for init.lua is AppData/Local/nvim/init.lua.
It also complains about a C compiler, but I just disable nvim-treesitter on windows.

---

# File structure explained
~/.config/nvim
├── init.lua
├── lua
│   ├── all-my-plugin-configs
│   │   ├── init.lua
│   │   ├── myplugin1.lua
│   │   ├── myplugin2.lua
│   │   ├── myplugin3.lua
│   └── core
│       ├── install-packer.lua
│       ├── keymaps.lua
│       └── misc-vim-stuff.lua
└── plugin
    └── packer_compiled.lua

The main init.lua file is the first place neovim will look for configuration stuff.
From there, we have the 'core' and 'all-my-plugin-configs' directories.
The 'core' directory has all the stock vim config stuff, as well as the plugin manager stuff.
All my plugin configs are found exactly where you think they are.

There is a mini init.lua file in 'all-my-plugin-configs' that grabs all the individual plugin
configs. When installing new plugins, 

When requiring a lua file from another, always imagine yourself as starting from the 'lua'
directory. Forget about where your current lua file is located.

---

# How to install new plugins
- Go to wherever packer is installed and find where all the other plugins are.
With the plugin's github repo name in mind, add a line that looks something like this:
```lua
use 'plugin_repo/plugin_name.nvim'
```
- To actually install the thing, run :source and then :PackerSync
- Then, you'll want to add a config file for that plugin.
- Remember to require the new plugin's config file from the mini init.lua.

# Nvim-tree help
While in nvim-tree, do g?

# LSP help
To see lsp-zero's keybindings, i've mapped <leader>lsp to open that help screen :)

The commands :LspStop and :LspStart do exactly what you think

If you're in a file an don't have LSP support, run :Mason and then you can find a suitable server.
If you'd rather have some choices based on the file contents, run :LspInstall for server options.

To select some code from a pop-up, do ctrl+y
To rename, use F2
To format, use F3

# Comment.nvim
use gcc to toggle comments on the current line
or, if you'd rather select some lines in visual line mode, use gc

# Leap.nvim
use <leader>s to search for a character.
then you can use <space> to jump to the next group, or <tab> for previous group

# Extra notes
In order for nvim-tree to display the cute little icons, you'll need a Nerd Font. See bash quick reference.

Nvim-tree also uses ctrl+v to do vertical split, but this doesn't work on windows sometimes.
To fix, remove the ctrl+v binding in windows terminal.

While in telescope, ctrl+c to leave.
To see insert mode bindings, do ctrl+/
To see normal mode bindings, do ?

Note that in order to use telescope's fuzzy finding within files (default is <leader>fg),
you'll need to install the ripgrep package. this is on your machine, not in nvim.

I've added <leader>td to open the TODOs list

Note: to do case-insensitive search temporarily, type your search and add a '\c' to it.
