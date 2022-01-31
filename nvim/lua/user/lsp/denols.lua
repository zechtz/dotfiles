local nvim_lsp = require("lspconfig")

nvim_lsp.denols.setup({
	root_dir = nvim_lsp.util.root_pattern("deno.json"),
})
