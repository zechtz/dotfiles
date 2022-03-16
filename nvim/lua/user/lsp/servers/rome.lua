local on_attach = require("user.lsp.handlers").on_attach

require("lspconfig").rome.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		on_attach(client)
	end,
})
