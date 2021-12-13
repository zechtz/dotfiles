require("settings")
require("keymappings")

-- require("plugins.go")
require("plugins.airline")
require("plugins.config.floaterm")

-- Use Plug to manage plugins
vim.call('plug#begin', '~/.config/nvim/plugged')
--color schemes
require("colorschemes")
-- vim utils move to own file as well
require("utils")
-- syntax plugins - move to own file
require("syntax")
vim.call('plug#end')

require("colors.tokyostorm")
require("colors.dark")
