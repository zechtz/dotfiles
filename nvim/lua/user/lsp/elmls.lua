local nvim_lsp = require("lspconfig")

nvim_lsp.elmls.setup({
	root_dir = nvim_lsp.util.root_pattern("elm.json"),
	cmd = { "elm-language-server" },
	filetypes = { "elm" },
	init_options = {
		elmAnalyseTrigger = "change",
		elmFormatPath = "elm-format",
		elmPath = "elm",
		elmTestPath = "elm-test",
	},
})
