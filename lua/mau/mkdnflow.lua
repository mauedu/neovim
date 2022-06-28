require('mkdnflow').setup({

    links = {
        transform_explicit = function(text)
            text = text:gsub(" ", "-")
            text = text:lower()
            -- Don't add date to the new link titles
            -- text = os.date('%Y-%m-%d_') .. text
            return (text)
        end
    },
})


_G.find_files = function()
    local opts = {
        attach_mappings = function(_, map)
            map("i", "<C-n>", function(prompt_bufnr)
                -- filename is available at entry[1]
                local entry = require("telescope.actions.state").get_selected_entry()
                print(vim.inspect(entry))
                print(entry[1])
                require("telescope.actions").close(prompt_bufnr)
            end)

            return true
        end,
    }

    require("telescope.builtin").find_files(opts)
end
