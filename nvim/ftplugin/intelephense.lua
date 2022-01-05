local configs = require("lspconfig/configs")
local util = require("lspconfig/util")

local server_name = "intelephense"
configs[server_name] = {
	default_config = {
		filetypes = { "php" },
		cmd = { "intelephense", "--stdio" },
		root_dir = function(fname)
			return util.root_pattern("composer.json", ".git")(fname) or vim.loop.os_homedir()
		end,
	},
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
	vim.cmd([[set softtabstop=4]])
	vim.cmd([[set shiftwidth=8]])
	vim.cmd([[set noexpandtab]])
}

-- vim:et ts=2 sw=2
