local on_attach = require("user.lsp.handlers").on_attach

require("lspconfig").denols.setup({
	cmd = { "deno", "lsp" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	init_options = {
		enable = true,
		lint = true,
		unstable = false,
	},
	on_attach = function(client)
		on_attach(client)
	end,
})
