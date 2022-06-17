local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Neotree
keymap('n', '<Leader>e', ':Neotree toggle reveal<CR>', opts)

-- Alpha-nvim (home screen)
keymap('n', '<c-n>', ':Alpha<cr>', { noremap = true })

keymap('n', '<leader>t', ':ToggleTerm<CR>', opts)
keymap('n', '<leader>ts', ':ToggleTerm size=80 direction=vertical<CR>', opts)
keymap('n', '<leader>th', ':ToggleTerm size=20 direction=horizontal<CR>', opts)
keymap('n', '<leader>tf', ':ToggleTerm direction=float<CR>', opts)
keymap('t', '<leader>t', '<C-\\><C-n>:ToggleTerm<CR>', opts)
keymap('t', '<leader><Esc>', '<C-\\><C-n>', opts)

-- Conigure lazygit to open in float terminal on keybinding
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
-- lazygit will only run once the keybinding is called
function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

