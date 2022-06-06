--[[ Broken into respective modules ]]
-- TODO: If a require fails, don't crash, continue to next one.

-- Basic settings involving only built-in functionality
require('mau/settings_basic')
require('mau/keys_basic')    

-- Load packer.nvim (Bootstrapping if never installed)
require('mau/packer_setup')

-- Keymaps involving plugins
require('mau/keys_plugins')

-- Seetings involving plugins
require('mau/settings_plugins')

