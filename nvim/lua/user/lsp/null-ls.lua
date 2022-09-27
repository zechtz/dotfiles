local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then return end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {
    formatting.deno_fmt, formatting.phpcsfixer, formatting.prettierd, formatting.lua_format.with {
      extra_args = {
        "--no-keep-simple-function-one-line", "--no-break-after-operator", "--column-limit=100",
        "--break-after-table-lb", "--indent-width=2"
      }
    }, formatting.black.with {extra_args = {"--fast"}}, formatting.stylua, formatting.shfmt,
    formatting.google_java_format, formatting.isort,
    formatting.rubocop,
    formatting.mix,
    formatting.codespell.with {filetypes = {"markdown"}}, -- diagnostics.flake8,
    diagnostics.shellcheck
  }
}

local unwrap = {
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = {"rust"},
  generator = {
    fn = function(params)
      local diagnostics = {}
      -- sources have access to a params object
      -- containing info about the current file and editor state
      for i, line in ipairs(params.content) do
        local col, end_col = line:find "unwrap()"
        if col and end_col then
          -- null-ls fills in undefined positions
          -- and converts source diagnostics into the required format
          table.insert(diagnostics, {
            row = i,
            col = col,
            end_col = end_col,
            source = "unwrap",
            message = "hey " .. os.getenv("USER") .. ", don't forget to handle this",
            severity = 2
          })
        end
      end
      return diagnostics
    end
  }
}

null_ls.register(unwrap)
