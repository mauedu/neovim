-- LSP Client & Installer
-- :LspInfo shows the status of active and configured language servers.
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.setup {
    automatic_installation = true
}

local lspconfig = require('lspconfig')

local default_servers = {
    "bashls",
    "clangd",
    "cmake",
    "pyright",
    "html",
    "cssls",
    "emmet_ls",
}

-- Define new sybols for diagnostics.
-- From https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local on_attach = function(client, bufnr)
    -- Disabled since using Autocompletion with nvim-cmp
    -- Enable completion triggered by <c-x><c-o>
    --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, buffer = bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, bufopts)


    --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    --vim.keymap.set('n', '<space>wl', function()
    --print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --end, bufopts)
end

-- Add additional capabilities supported by nvim-cmp
-- From https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Setup default servers (don't need custom settings)
for _, lsp in pairs(default_servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- Servers with custom settings must be loaded one by one
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
}
