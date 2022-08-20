local g = vim.g -- a table to access global variables
local opt = vim.o -- to set options

opt.belloff = "all" -- * I cannot emphasise enough how little I want to hear the bell. *

opt.pumblend = 17
opt.wildoptions = "pum"
opt.wildmenu = true
opt.ruler = true

opt.background = "dark" -- Dark background colorscheme
opt.termguicolors = true -- True color support

opt.number = true -- Line numbers

opt.cursorline = true -- Highlight the current line

opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2 -- Number of spaces tabs count for
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.smartindent = true -- Insert indents automatically

opt.hidden = true -- Enable background buffers
opt.showmatch = true -- show matching brackets when text indicator is over them

-- Search Options
opt.magic = true -- Changes the way backslashes work in search patterns
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Only ignore case when lowercase; override by using capitals
opt.incsearch = true -- Show match for partly typed search commands

opt.joinspaces = false -- No double spaces with join
opt.list = true -- Show some invisible characters

opt.scrolloff = 4 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context

opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.equalalways = false -- Stop changing my bloody splits!

opt.wrap = false -- Disable line wrap

opt.swapfile = false -- This rarely has been anything other than annoying!
opt.backup = false -- Don't save backup files

opt.iskeyword = opt.iskeyword .. ",-" -- Treat dash separated words as word text object

opt.mouse = "a" -- Sometimes I like to use the mouse, ok!

-- Improve timeout
opt.timeoutlen = 200
opt.ttimeoutlen = 0
opt.updatetime = 300

g.python_host_skip_check = 1
g.python3_host_skip_check = 1
g.python3_host_prog = "~/.asdf/shims/python3"
g.python_host_prog = "~/.asdf/shims/python2"
