NEOVIM QUICK REFERENCE
Quickly navigate this file by matching regex /^\#/ with the vim quickfix list

---

# Install neovim (this is harder than it should be)
The apt version of neovim is super out of date. Use the appimage instead.
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
mv nvim.appimage nvim
chmod u+x nvim
mv nvim /usr/bin
```

(You may need to install `libfuse2`)
(also try `./nvim --appimage-extract-and-run` (make an alias for this!))

If the appimage doesn't work, you might have to build from source.
Not too complicated - just follow the instructions on the neovim github, making sure
to consider installing it in the way that allows for uninstalling.

# REMINDERS !!!!!!
use <c-^> (alternate file) more
use the r and R motions more
check out :options some time. it's pretty neato
use :lua to easily test stuff
use cit to change inside html tags
USE CODE ACTIONS <leader>ca
use U motion to toggle the most recent change
g; to go to previous change (also g, for newer change)
gi to go to the previous 'insert to normal' transition location
// to repeat the previous search
beyond * and #, use g* and g# (more fuzzy). example: * on 'the' --> 'there'
^a and ^x can be prefixed with numbers i.e. 5^a on the number 10 --> 15

# Windows installation
The default location for init.lua is AppData/Local/nvim/init.lua.
It also complains about a C compiler, but I just disable nvim-treesitter on windows.

---

# File structure explained
~/.config/nvim
├── init.lua
├── lazy-lock.json
└── lua
    ├── core
    │   ├── keymaps.lua
    │   └── misc-vim-stuff.lua
    └── plugin-configs
        ├── init.lua
        ├── myplugin1.lua
        ├── myplugin2.lua
        └── myplugin3.lua

The main init.lua file is the first place neovim will look for configuration stuff.
From there, we have the 'core' and 'plugin-configs' directories.
The 'core' directory has all the stock vim config stuff, as well as the plugin manager stuff.
Plugins configs are exactly where you think they are.

There is a mini init.lua file in 'all-my-plugin-configs' that grabs all the
individual plugin configs. When installing new plugins, make sure to add them
to this mini init.lua.

When requiring a lua file from another, always imagine yourself as starting from the 'lua'
directory. Forget about where your current lua file is located.

---

# how to run vimscript within init.lua
vim.cmd('echo "foo"')
or
vim.cmd([[
    echo "foo"
    echo "bar"
]])

# How to install new plugins
- Go to wherever lazy is installed and find where all the other plugins are.
With the plugin's github repo name in mind, add a line that looks something like this:
```lua
use 'plugin_repo/plugin_name.nvim'
```
- Then, you'll want to add a config file for that plugin.
- Remember to require the new plugin's config file from the mini init.lua.

# Nvim-tree
To see help, do `g?`

# LSP help
To see lsp-zero's keybindings, i've mapped <leader>lsp to open that help screen :)
To scroll up/down in the autocomplete menu, use ctrl+n and ctrl+p as per usual.
To scroll up/down for a particular autocomplete option, use ctrl+u and ctrl+d.

The commands :LspStop and :LspStart do exactly what you think

If you're in a file an don't have LSP support, run :Mason and then you can find a suitable server.
If you'd rather have some choices based on the file contents, run :LspInstall for server options.

To select some code from a pop-up, do ctrl+y

# custom lsp setup
after a while, i wanted to get away from lsp-zero and handle everything myself.

to see the LSP configs that are provided by the lspconfig plugin, run
:h lspconfig-all

# Comment.nvim
use `gcc` to toggle comments on the current line
or, if you'd rather select some lines in visual line mode, use gc

# Folds (applies to normal vim as well)
zr to open all folds
zm to close all folds

# Reload a file that was edited elsewhere
Working on a file in nvim and vscode simultaneously?
Neovim won't automatically load the new changes.
Use `:edit` or just `:e` to get the latest version of the file.

# more vscode neovim trouble
if installing neovim from source, you'll have to point the nvim extension to the
nvim executable.
also make sure the 'useWSL' flag is not synced.

# Terminal emulator
to open, use :term just like in normal vim.
to exit, do <C-\> followed by <C-n>

# the quickfix list
Populate the quickfix list using something like :vimgrep and then you can jump
around to all the things that need quick fixing

Find all markdown headers in the current buffer (%)
- :vimgrep /^\#/ %
Open quickfix list
- :cope
Go to next markdown header
- :cn

You can vimgrep with multiple files
Find all instances of 'foo' in all python and cpp files in the cwd:

- :vimgrep /foo/ *.py *.cpp

Search everything in the lua directory, recursively into subdirectories
- :vim /findme/ lua/**

There is also a window-local version of the quickfix list (the "location list").
It's used in the same way as the quickfix list but all the commands use 'l'
instead of 'c' at the beginning.

vim stores multiple qf lists. navigate your history using :colder and :cnewer

# auto commands vs user commands
- auto commands are run in event-driven way, for example, when a buffer is opened
:h lua-guide-autocommand-create
:h events
- user commands are typed in vim's command prompt, like :HowdyYall
:h `nvim_create_user_command()`

# insert mode bindings
Indent ('Tab') C-t
De-indent ('Delete a tab') C-d
Un-indent (remove all tabs) C-u

Pop into normal mode for a single command, then back into insert mode:
C-o

To insert the vim representation of a special key, use C-v followed by that key.
For example, typing C-v <enter> produces 
This is useful for creating macros and commands and such

Digraphs can be entered with C-k, but i currently have that replaced with a
plugin that has searching functionality.
For manual digraph entry, see :digraphs for a list of available symbols.

# vim registers

## tips
always select the register using "<reg> BEFORE storing in it / pasting from it
- "0 is useful

## all the registers

- the " register is the unnamed register. it's the default register used with
  motions like ydcsx
- 26 alphabetic registers. you can use either "A or "a but lowercase will
  replace the register content while uppercase will append to it
- the - register is the 'small delete' register. any deletion that is smaller
  than a line will go here. (deletions 1 line or longer go to number registers)
- number 0 is always the most recently yanked text.
- number 1 is the most recently deleted text (unless you specify another reg or
  it's shorter than one line, causing it to go into the - register instead)
- numbers 2 through 9 are just history for the "1 register. when the contents of
  "1 are replaced, they go to 2, then to 3, and so on.
- the + register is the system clipboard, though neovim supports shift+ctrl+v
- the * register is another kind of system clipboard. idk just use + instead.
- the : register contains the most recently used command
- the . register contains the most recently inserted text
- the % register is the name of the current file (relative to vim's cwd)
- the # register is the name of the current alternate file (full path)
- the # register contains the most recent search
- the _ is the black hole register. use this when a script or plugin edits some
  text and you don't want to mess up the user's registers

# Extra notes
To see the previous output of commands, use :messages

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

Note: plugins are stored in ~/.local/share/nvim

When searching with %s, you can add a /c flag to the end to enable
"confirmation" mode, meaning it will confirm each replace

Problem with LSP:
If you see an error count on the left side of lualine but do not see the little
diagnostic messages throughout your code, try :e for just reopening the file on
its own. wait for the LSP stuff to appear; don't try to open a new buffer in the
middle of its loading

generally, if things don't work, just do :LspZeroSetupServers

dude. you can use :TOhtml to convert the entire current buffer into html with
line numbers and everything. i don't know where to use this but that is super
rad.

to change the filetype of the current buffer (useful for when you have a
temporary vim instance open and don't want to save the file), use the `setf`
command.

To fix "failed to create python3 virtual environment" in mason when trying to
install certain cpp things, try apt installing "python3-venv"

EXPRESSION REGISTER:
when in INSERT or COMMAND mode, you can use <C-r> to paste the contents of a
register. this is useful for copying some stuff, then pasting it into the =
command, which will output the numeric result

example:   :^r=123%5   outputs 3

in fact, this is just useful everywhere.
use ctrl+r in command mode to access registers

if you select something but back out of visual mode, you can reselect it using `gv`

similar thing with insert mode and `gi`

to match a newline, use \n
to substitute with a newline, you need to use \r
:s/endofline/\r/g

TO FIX TREESITTER "error executing lua problem..." error
(this usually appears opening a gitcommit file),
run :TSUpdate

you can do :right to right-align text. :center and :left also exist.

hey, :h vim.ui is really neato. check it out sometime

g<c-g> will show the word count

use a | to run multiple vim commands. kinda like bash ;

ga will show the codepoint value of the character under the cursor
