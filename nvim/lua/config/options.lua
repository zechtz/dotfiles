-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.showtabline = 0 -- always show tabs
vim.opt.undolevels = 10000 -- How many undos
vim.opt.undoreload = 10000 -- number of lines to save for undo
vim.opt.conceallevel = 3
vim.g.onedarker_italic_comments = true

vim.cmd([[set iskeyword+=-]])
vim.api.nvim_set_hl(0, "Comment", { italic = true })

-- TODO  come back here
