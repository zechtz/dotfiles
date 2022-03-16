local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local on_attach = require("user.lsp.handlers").on_attach

require("null-ls").setup({
	sources = {
		-- diagnostics
		null_ls.builtins.diagnostics.eslint_d,

		-- formatters
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.stylua,
	},
	on_attach = on_attach,
})
