-- TODO: Can I also use vim.o? How is vim.opt different from the later?
local opt = vim.opt

vim.g.mapleader = ";"

-- Most configurations inspired by chris@machine
-- See https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/options.lua
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = -1    -- When 'softtabstop' is negative, the value of 'shiftwidth' is used.
opt.number = true
opt.relativenumber = true
opt.hidden = true     -- Allow midified unsaved buffers to be hidden
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window

-- Lexplore
vim.g.netrw_browse_split = 2  -- open file in vertical split
vim.g.netrw_winsize = 20
vim.g.netrw_liststyle = 3


