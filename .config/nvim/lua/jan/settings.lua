--Cursor
vim.opt.guicursor = ""

--Enable line numbering and relative number
vim.opt.nu = true
vim.opt.relativenumber = true

--Number of spaces to use for a tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

--Lines above and below cursor while navigating file
vim.opt.scrolloff = 8

--How ofter the swapFile gets updated during inserting
vim.opt.updatetime = 50

--Enable truecolor
vim.opt.termguicolors = true

-- use system clipboard as default register
vim.opt.clipboard:append("unnamedplus")

--Max columncount
vim.opt.colorcolumn = "80"
