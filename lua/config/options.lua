local opt = vim.opt
local o = vim.o
local g = vim.g

-- Numbers
opt.number = true
opt.relativenumber = true

-- tabline
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.colorcolumn = ""

-- setup undo
o.undofile = true

-- terminal colors
opt.termguicolors = true
opt.signcolumn = "yes"

-- clipboard
opt.clipboard = "unnamedplus"

-- cursor line
o.cursorline = true

-- disable nvim intro
opt.shortmess:append "sI"

-- misc
opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- shell
opt.shell = "zsh"
