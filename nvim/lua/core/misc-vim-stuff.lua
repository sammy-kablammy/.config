-- this file is for vimrc-style things other than remap stuff

-- use spaces instead of tabs
vim.opt.expandtab = true

-- 'tabstop' is the number of characters in a tab byte
vim.opt.tabstop = 4

-- 'shiftwidth' is the number of characters to shift when using << or >>
vim.opt.shiftwidth = 4

-- disable mouse
vim.opt.mouse = ""

-- disable line wrapping by default
-- note: this only makes vim display a line as multiple lines, it won't insert any linebreaks
vim.opt.wrap = false
-- break up text onto the next line after 100 characters
-- this applies to comments if 'c' is a formatoption; it applies to normal text if 't' is set
vim.opt.textwidth = 80

-- big column at 100 chars
vim.opt.colorcolumn = "80"

-- hide the command line since lualine is cooler
-- vim.opt.cmdheight = 0
vim.opt.showmode = false

-- see :h fo-table for information about this stuff
-- basically, you want 'r' enabled so that comments are continued in insert mode
-- but you want 'o' disabled so that comments do not continue when using the 'o' motion
-- also you need to use an autocmd because "vim.opt.formatoptions" gets overwritten somehow :(
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
        vim.opt.formatoptions = "jcrql"
        if vim.bo.filetype == "markdown" then
            -- the 't' formatoption inserts line breaks on lines that are too long
            vim.opt.formatoptions = vim.opt.formatoptions + "t"
        end
    end
})

-- stop highlighting the darn searches all the time!!!!
vim.opt.hlsearch = false

-- If a search query includes caps then it's case-sensitive, else it's case-insensitive.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- faster autosave for swapfiles
vim.opt.updatetime = 50

-- self-explanatory enough
vim.opt.number = true         -- needed for absolute number on current line
vim.opt.relativenumber = true -- relative everywhere else
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.splitbelow = true
vim.opt.splitright = true
