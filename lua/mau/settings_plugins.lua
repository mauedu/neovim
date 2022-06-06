-- Seetings involving plugins

-- Colorscheme must be set after color plugin is installed
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]

-- Treesitter
local configs = require'nvim-treesitter.configs'
configs.setup {
    ensure_installed = {"lua", "python", "bash"}, -- Starting minimalistic
    -- Check installaed languages with :TSInstallInfo
    -- ensure_installed = "maintained", -- Only use parsers that are maintained
    
    highlight = { -- enable highlighting
        enable = true, 
    },
    indent = {
        enable = true, -- default is disabled 
    }
}
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

