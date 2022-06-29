-- Seetings involving plugins

-- Colorscheme must be set after color plugin is installed
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_colors = { bg_float = "#303030", bg_popup = "#303030" }
-- Load the colorscheme
vim.cmd [[colorscheme tokyonight]]

-- Treesitter
local t_configs = require 'nvim-treesitter.configs'
t_configs.setup {
    ensure_installed = { "lua", "python", "bash", "markdown" }, -- Starting minimalistic
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

-- nvim-cmp setup
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    print("CMP failed!")
    return
end

-- luasnip setup
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    print("LuaSnip failed!")
    return
end

-- Vscode-like: To use existing vs-code style snippets from a plugin (eg. rafamadriz/friendly-snippets)
-- simply install the plugin and then add. See LuaSnip Github
require("luasnip/loaders/from_vscode").lazy_load()

-- Make use of <Tab> more intuitive. From Chris@machine
-- TODO: Understand & confirm how this works.
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- Nice icons for auto-complete meta info
--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Operator = "",
    Event = "",
    TypeParameter = "",
}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    window = {
        documentation = cmp.config.window.bordered(),
        --completion = cmp.config.window.bordered(),
    }
}

require("neo-tree").setup({
    buffers = {
        follow_current_file = true, -- This will find and focus the file in the active buffer every
    }
})

require('lualine').setup()

-- Enable markdown folding based on regex
vim.cmd [[
    let g:markdown_folding = 1
    " When editing a markdown file, fold headings level 4 more
    " Learned from https://bitcrowd.dev/folding-sections-of-markdown-in-vim
    au FileType markdown setlocal foldlevel=3
]]

-- From https://github.com/crispgm/telescope-heading.nvim

-- enable treesitter parsing
local telescope = require('telescope')
telescope.setup({
    -- ...
    extensions = {
        heading = {
            treesitter = true,
        },
    },
})
-- `load_extension` must be after `telescope.setup`
telescope.load_extension('heading')

-- Vimwiki
-- vim.cmd [[
--     let wiki_personal = {
--     \   'path' : '~/Insync/mauri.andres@gmail.com/GDrive/Local Sync/ZettleMau/',
--     \   'syntax' : 'markdown',
--     \   'ext' : '.md',
--     \}
--
--     let g:vimwiki_list = [wiki_personal]
--     let g:vimwiki_markdown_link_ext = 1
--
--     let g:vimwiki_folding = 'expr'
-- ]]
