-- ## Basic Keymaps ## --
-- Keymaps for built-in functionality only. Should always work if plugins can't be loaded.

-- Syntax: vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})

local keymap = vim.api.nvim_set_keymap

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

local opts = { noremap = true }

keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
