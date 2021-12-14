require("settings")
require("keymappings")

-- require("plugins.go")
require("plugins.airline")
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

require("plugins.lspconfig")
require("plugins.ultisnips")

require("colors.tokyostorm")
require("colors.dark")

--language servers
require("ls.rust")
require("ls.ts")
require("ls.python-lsp")
require("ls.bash-lsp")
require("ls.elixir-lsp")
