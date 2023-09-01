-- this file is for vimrc-style things other than remap stuff

-- use spaces instead of tabs
vim.opt.expandtab = true

-- 'tabstop' is the number of characters in a tab byte
vim.opt.tabstop = 4

-- 'shiftwidth' is the number of characters to shift when using << or >>
vim.opt.shiftwidth = 4

-- disable mouse
vim.opt.mouse = ""

-- disable line wrapping.
vim.opt.wrap = false
-- break up text onto the next line after 100 characters
-- vim.opt.textwidth = 100

-- big column at 100 chars
vim.opt.colorcolumn = "100"

-- stop highlighting the darn searches all the time!!!!
vim.opt.hlsearch = false

-- If a search query includes caps then it's case-sensitive, else it's case-insensitive.
vim.opt.smartcase = true

-- faster autosave for swapfiles
vim.opt.updatetime = 50

-- self-explanatory enough
vim.opt.number = true -- needed for absolute number on current line
vim.opt.relativenumber = true -- relative everywhere else
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.splitright = true
vim.opt.splitbelow = true
