local M = {}

local function map(mode, shortcut, command)
	opts = {}
	vim.api.nvim_set_keymap(mode, shortcut, command, opts)
end

function M.setup()
	vim.cmd([[set softtabstop=4]])
	vim.cmd([[set shiftwidth=4]])
	vim.cmd([[set noexpandtab]])
	require("jdtls").start_or_attach({ cmd = { "launch_jdtls" } })
end

return M
