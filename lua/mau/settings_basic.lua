-- TODO: Can I also use vim.o? How is vim.opt different from the later?
local opt = vim.opt

vim.g.mapleader = ";"

opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = -1    -- When 'softtabstop' is negative, the value of 'shiftwidth' is used.
opt.number = true
opt.relativenumber = true
--opt.hidden = true     -- Allow midified unsaved buffers to be hidden

-- Lexplore
vim.g.netrw_browse_split = 2  -- open file in vertical split
vim.g.netrw_winsize = 20
vim.g.netrw_liststyle = 3


