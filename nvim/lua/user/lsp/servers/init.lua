vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		prefix = "●",
		spacing = 2,
	},
	update_in_insert = true,
	severity_sort = true,
})

vim.fn.sign_define("LspDiagnosticsSignError", {
	text = "✖",
	numhl = "LspDiagnosticsDefaultError",
})
vim.fn.sign_define("LspDiagnosticsSignWarning", {
	text = "▲",
	numhl = "LspDiagnosticsDefaultWarning",
})
vim.fn.sign_define("LspDiagnosticsSignInformation", {
	text = "●",
	numhl = "LspDiagnosticsDefaultInformation",
})
vim.fn.sign_define("LspDiagnosticsSignHint", {
	text = "✱",
	numhl = "LspDiagnosticsDefaultHint",
})

require("user.lsp.servers.bash")
require("user.lsp.servers.css")
require("user.lsp.servers.deno")
require("user.lsp.servers.emmet_ls")
require("user.lsp.servers.html")
require("user.lsp.servers.jsonls")
require("user.lsp.servers.pyright")
require("user.lsp.servers.rome")
require("user.lsp.servers.solang")
require("user.lsp.servers.solc")
require("user.lsp.servers.sql")
require("user.lsp.servers.sumneko_lua")
require("user.lsp.servers.typescript")
require("user.lsp.servers.vim")
