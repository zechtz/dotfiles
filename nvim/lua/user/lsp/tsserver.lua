local nvim_lsp = require("lspconfig")

nvim_lsp.tsserver.setup({
	-- Omitting some options
	root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
})
