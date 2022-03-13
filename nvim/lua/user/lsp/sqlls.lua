local capabilities = require("user.lsp.handlers").capabilities
local on_attach = require("user.lsp.handlers").on_attach

local M = {}

function M.setup()
	vim.cmd([[set softtabstop=2]])
	vim.cmd([[set shiftwidth=2]])
	vim.cmd([[set noexpandtab]])

	local config = {
		flags = {
			allow_incremental_sync = true,
		},
		capabilities = capabilities,
		on_attach = on_attach,
	}

	config.cmd = { "sql-language-server", "up", "--method", "stdio" }
	config.on_attach = on_attach

	-- Server
	require("sqlls").start_or_attach(config)
end

return M
