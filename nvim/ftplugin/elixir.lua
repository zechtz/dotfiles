local M = {}

function M.setup()
	local root_markers = { "mix.exs" }
	local home = os.getenv("HOME")
	local root_dir = require("elixirls.setup").find_root(root_markers)

	vim.cmd([[set softtabstop=2]])
	vim.cmd([[set shiftwidth=2]])
	vim.cmd([[set noexpandtab]])

	local on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
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

	local workspace_folder = home .. "/.workspace" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

	local config = {
		flags = {
			allow_incremental_sync = true,
		},
		capabilities = capabilities,
		on_attach = on_attach,
	}

	config.cmd = { "language_server.sh", workspace_folder }
	config.on_attach = on_attach

	config.on_init = function(client, _)
		client.notify("workspace/didChangeConfiguration", { settings = config.settings })
	end

	local extendedClientCapabilities = require("elixirls").extendedClientCapabilities
	extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

	config.init_options = {
		-- bundles = bundles;
		extendedClientCapabilities = extendedClientCapabilities,
	}

	-- Server
	require("elixirls").start_or_attach(config)
end

return M
