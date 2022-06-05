
-- TODO: Can I also use vim.o? How is vim.opt different from the later?
local opt = vim.opt

vim.g.mapleader = ","
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = -1    -- When 'softtabstop' is negative, the value of 'shiftwidth' is used.
opt.number = true
     
-- Lexplore
vim.g.netrw_browse_split = 2  -- open file in vertical split
vim.g.netrw_winsize = 30

-- ## Keymaps ## --

-- Syntax: vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})

local keymap = vim.api.nvim_set_keymap

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

local opts = { noremap = true }

keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
    
-- Load packer.nvim (Bootstrapping if not installed)
require('packer_setup')

-- Neotree
keymap('n', '<Leader>e', ':Neotree toggle<CR>', opts)

vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]


