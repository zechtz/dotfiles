local lsp_config = require("lspconfig")
local on_attach = require("user.lsp.handlers").on_attach

lsp_config.vimls.setup({
	on_attach = on_attach,
})
