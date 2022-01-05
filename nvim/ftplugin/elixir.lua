local configs = require("lspconfig/configs")
local util = require("lspconfig/util")

local server_name = "elixirls"
configs[server_name] = {
	default_config = {
		filetypes = { "elixir", "eelixir" },
		root_dir = function(fname)
			return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
		end,
	},
	docs = {
		package_json = "https://raw.githubusercontent.com/elixir-lsp/vscode-elixir-ls/master/package.json",
		default_config = {
			root_dir = [[root_pattern("mix.exs", ".git") or vim.loop.os_homedir()]],
		},
	},
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = true
		client.resolved_capabilities.document_range_formatting = true
	end,
}

-- vim:et ts=2 sw=2
