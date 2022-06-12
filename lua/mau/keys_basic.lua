-- ## Basic Keymaps ## --
-- Keymaps for built-in functionality only. Should always work if plugins can't be loaded.

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Leader key defined in settings_basic.lua

-- Syntax: vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})
local keymap = vim.api.nvim_set_keymap

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

local opts = { noremap = true }

keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("n", "<A-Down>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-Up>", "<Esc>:m .-2<CR>==", opts)
keymap("v", "<A-Down>", ":m .+1<CR>==", opts)
keymap("v", "<A-Up>", ":m .-2<CR>==", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)

-- Stay in indent mode w/ multi line select
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- When pasting over a word, don't put replaced word in clipboard
--keymap("v", "p", '"_dP', opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

-- Toogle file navigation (overwritten for nvim-tree in keys_plugins.lua)
keymap('n', '<Leader>e', ':Lexplore<CR>', opts)

-- Shift tabs sideways
keymap('n', '<Leader><C-PageUp>', ':tabm-<CR>', opts)
keymap('n', '<Leader><C-PageDown>', ':tabm+<CR>', opts)

-- Show and select buffer
keymap('n', '<Leader>b', ':ls<CR>:buffer ', opts)

-- Saving & reloading sessions on working directory
keymap('n', '<Leader>ss', ':mksession!<CR>', opts)
keymap('n', '<Leader>sr', ':so Session.vim<CR>', opts)

