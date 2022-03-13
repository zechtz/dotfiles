local capabilities = require("user.lsp.handlers").capabilities

require("lspconfig").html.setup({
	capabilities = capabilities,
})
