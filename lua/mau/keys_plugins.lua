
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Neotree
keymap('n', '<Leader>e', ':Neotree toggle<CR>', opts)
-- Alpha-nvim (home screen)
keymap('n', '<c-n>', ':Alpha<cr>', {noremap = true})

