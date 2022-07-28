local on_attach = require("user.lsp.handlers").on_attach

require 'lspconfig'.solargraph.setup { on_attach = on_attach, settings = {} }
