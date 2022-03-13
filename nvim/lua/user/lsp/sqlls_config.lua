local M = {}
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities)

function M.setup()
	vim.cmd([[set softtabstop=2]])
	vim.cmd([[set shiftwidth=2]])
	vim.cmd([[set noexpandtab]])

	local on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = true
		client.resolved_capabilities.document_range_formatting = true
	end

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
