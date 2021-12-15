require("settings")
require("keymappings")

-- require("plugins.go")
require("plugins.config.airline")
require("plugins.config.floaterm")

-- Use Plug to manage plugins
--color schemes
vim.call('plug#begin', '~/.config/nvim/plugged')
require("colorschemes")
-- vim utils move to own file as well
require("utils")
-- syntax plugins - move to own file
require("syntax")
vim.call('plug#end')

--language servers
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.colorizer")
require("user.project")
require("user.renamer")
require("user.session")
require("user.treesitter")
require("user.alpha")

-- colorschemes
require("colors.tokyostorm")
require("colors.dark")
