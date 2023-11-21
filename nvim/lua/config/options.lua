-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.showtabline = 0 -- always show tabs
vim.opt.undolevels = 10000 -- How many undos
vim.opt.undoreload = 10000 -- number of lines to save for undo
vim.opt.conceallevel = 3

-- git blame
vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = "<summary> • <date> • <author>"
vim.g.gitblame_highlight_group = "LineNr"

-- TODO  come back here
