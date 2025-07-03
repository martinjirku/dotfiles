-- Set leader keys FIRST before any mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core configuration
require("core.options")
require("core.keymaps")
require("core.autocomands")

-- Load plugin configuration
require("config.lazy")