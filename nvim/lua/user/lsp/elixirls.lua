local M = {}

function M.setup()
	vim.cmd([[set softtabstop=2]])
	vim.cmd([[set shiftwidth=2]])
	vim.cmd([[set noexpandtab]])

	local on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end

	local config = {
		flags = {
			allow_incremental_sync = true,
		},
		capabilities = capabilities,
		on_attach = on_attach,
	}

	config.cmd = { "language_server.sh" }
	config.on_attach = on_attach

	-- Server
	require("elixirls").start_or_attach(config)
end

return M
