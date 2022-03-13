local M = {}

function M.setup()
	vim.cmd([[set softtabstop=2]])
	vim.cmd([[set shiftwidth=2]])
	vim.cmd([[set noexpandtab]])

	local on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		require("solargraph.setup").add_commands()
		require("solargraph").setup_dap()
	end

	local capabilities = {
		workspace = {
			configuration = true,
		},
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				},
			},
		},
	}

	local config = {
		flags = {
			allow_incremental_sync = true,
		},
		capabilities = capabilities,
		on_attach = on_attach,
	}

	config.cmd = { "solargraph" }

	config.on_init = function(client, _)
		client.notify("workspace/didChangeConfiguration", { settings = config.settings })
	end

	local extendedClientCapabilities = require("solargraph").extendedClientCapabilities
	extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
	config.init_options = {
		-- bundles = bundles;
		extendedClientCapabilities = extendedClientCapabilities,
	}

	-- Server
	require("solargraph").start_or_attach(config)
end

return M
