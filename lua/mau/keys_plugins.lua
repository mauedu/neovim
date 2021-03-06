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

-- Lazygit

-- Conigure lazygit to open in float terminal on keybinding
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
-- lazygit will only run once the keybinding is called
function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

-- Telescope
--
keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
keymap('n', '<leader>fc', '<cmd>lua require("telescope.builtin").commands()<cr>', opts)
keymap('n', '<leader>fm', '<cmd>lua require("telescope.builtin").keymaps()<cr>', opts)
keymap('n', '<leader>fd', '<cmd>lua require("telescope.builtin").diagnostics({bufnr=0})<cr>', opts)
-- Offer the same command with df (diagnostics find)
keymap('n', '<leader>df', '<cmd>lua require("telescope.builtin").diagnostics({bufnr=0})<cr>', opts)
keymap('n', '<leader>fo', '<cmd>lua require("telescope.builtin").oldfiles()<cr>', opts)
-- Telescope plugins
keymap('n', '<C-b>', ':Telescope heading<cr>', opts)



-- Telekasten

-- keymap('n', '<leader>tf', ":lua require('telekasten').find_notes()<CR>", opts)
-- keymap('n', '<leader>td', ":lua require('telekasten').find_daily_notes()<CR>", opts)
-- keymap('n', '<leader>tg', ":lua require('telekasten').search_notes()<CR>", opts)
-- keymap('n', '<leader>tz', ":lua require('telekasten').follow_link()<CR>", opts)
-- keymap('n', '<leader>tl', ":lua require('telekasten').insert_link()<CR>", opts)

-- Mrknflow (custom)

keymap('n', '<leader>wp', '<cmd>lua find_file_path()<cr>', opts)
keymap('n', '<leader>wt', '<cmd>lua find_tags()<cr>', opts)


