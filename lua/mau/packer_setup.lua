-- Bootstrapping Packer
-- https://github.com/wbthomason/packer.nvim#bootstrapping

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
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
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
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

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)    -- return require('packer').startup(function(use)
