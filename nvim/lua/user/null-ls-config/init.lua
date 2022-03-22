local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.prettier.with {
      extra_filetypes = {"toml", "solidity", "javascriptreact"},
      extra_args = {"--no-semi", "--single-quote", "--jsx-single-quote"}
    }, formatting.black.with {extra_args = {"--fast"}}, formatting.gofmt, formatting.shfmt,
    formatting.clang_format, formatting.cmake_format, formatting.dart_format,
    formatting.lua_format.with({
      extra_args = {
        '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
        '--break-after-table-lb', '--indent-width=2'
      }
    }), formatting.isort, formatting.codespell.with({filetypes = {'markdown'}})
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 2000)
            augroup END
            ]])
    end
  end
})
