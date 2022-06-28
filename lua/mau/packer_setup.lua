-- Bootstrapping Packer
-- https://github.com/wbthomason/packer.nvim#bootstrapping

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
---[[
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_setup.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
---[[
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("CMP failed!")
    return
end
--]]


-- Have packer use a popup window
---[[
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}
--]]

--return require('packer').startup(function(use)
return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Have Packer manage itself
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
    use 'folke/tokyonight.nvim'
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
            -- Adding new entried to home screen.
            -- Don't forger to PackerSync after updating entried below
            local startify = require("alpha.themes.startify")
            startify.section.bottom_buttons.val = {
                startify.button("v", "neovim config", ":e ~/.config/nvim/init.lua<cr>"),
            }
        end
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    use {
        'williamboman/nvim-lsp-installer',
        requires = 'neovim/nvim-lspconfig',
    }

    -- Autocompletion with cmp
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    --use "hrsh7th/cmp-cmdline" -- cmdline completions

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Toggle comments in smart way.
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use { "akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
        require("toggleterm").setup()
    end }


    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- use 'vimwiki/vimwiki'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- use {
    --     'renerocksai/telekasten.nvim',
    --     requires = {
    --         { 'renerocksai/calendar-vim' },
    --     }
    -- }
    --
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end) -- return require('packer').startup(function(use)
