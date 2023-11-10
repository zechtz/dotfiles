local M = require("config.functions")

local root_markers = { ".git", ".proto", ".go", ".mod" }
local root_dir = M.find_root_dir(root_markers)
require("lspconfig").bufls.setup({
  print("bufls launched")
  root_dir = root_dir,
})
