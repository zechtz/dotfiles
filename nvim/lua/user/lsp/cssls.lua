local capabilities = require("user.lsp.handlers").capabilities

require("lspconfig").cssls.setup({
	capabilities = capabilities,
})
