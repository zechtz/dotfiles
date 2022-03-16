local on_attach = require("user.lsp.handlers").on_attach
local lsp_config = require("lspconfig")

lsp_config.bashls.setup({
	on_attach = on_attach,
})
