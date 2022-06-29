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

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- Custom function to pick file path from telescope
-- From: https://www.reddit.com/r/neovim/comments/nwk7wi/can_telescope_output_the_filename/
-- and https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md

_G.find_file_path = function()
    local opts = {
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.api.nvim_feedkeys("i" .. selection[1], "t", true)
            end)
            return true
        end,
    }
    require("telescope.builtin").find_files(opts)
end

-- Find tags in directory structure
_G.find_tags = function()
    local search = vim.fn.expand("<cword>")
    local opts = {
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_current_line()
                vim.api.nvim_feedkeys("a" .. selection, "t", true)
            end)
            return true
        end,
        default_text = search
    }
    require("telescope.builtin").live_grep(opts)
    vim.api.nvim_feedkeys("#", "t", true)
end

