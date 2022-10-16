local vim = vim

-- override hover
-- if current line have diagnostics message,
-- show diagnostics message float window, otherwise
-- use the normal hover.
local vim_lsp_buf_hover = vim.lsp.buf.hover
local hover = function()
  if not vim.diagnostic.open_float(nil, { scope = "cursor" }) then
    vim_lsp_buf_hover()
  end
end

-- Override open_floating_preview
local vim_lsp_util_open_floating_preview = vim.lsp.util.open_floating_preview
local open_floating_preview = function(contents, syntax, opts)
  opts.border = opts.border or "rounded"
  local floating_bufnr, floating_winnr = vim_lsp_util_open_floating_preview(contents, syntax, opts)
  vim.keymap.set("n", "<Esc>", "<Cmd>bdelete<CR>", { buffer = floating_bufnr })
  return floating_bufnr, floating_winnr
end

local disable_formatting = { "tsserver" }

local on_attach = function(client, bufnr)
  local builtin = require "telescope.builtin"

  local function buf_set_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
  end

  -- stylua: ignore start
  buf_set_keymap("n", "gD", vim.lsp.buf.declaration)
  buf_set_keymap("n", "gd", builtin.lsp_definitions)
  buf_set_keymap("n", "gr", builtin.lsp_references)
  buf_set_keymap("n", "gi", builtin.lsp_implementations)
  buf_set_keymap("n", "K", vim.lsp.buf.hover)
  buf_set_keymap("i", "<C-K>", vim.lsp.buf.signature_help)
  buf_set_keymap("n", "<leader>lr", vim.lsp.buf.rename)
  buf_set_keymap("n", "<leader>ld", function()
    builtin.diagnostics {no_sign = true}
  end)
  buf_set_keymap("n", "<leader>lD", function()
    vim.diagnostic.goto_next {severity = vim.diagnostic.severity.E}
  end)
  buf_set_keymap("n", "<leader>ls", builtin.lsp_document_symbols)

  buf_set_keymap("n", "<leader>la", vim.lsp.buf.code_action)
  buf_set_keymap("v", "<leader>la", "<Cmd>lua vim.lsp.buf.range_code_action()<CR><ESC>")

  if not vim.tbl_contains(disable_formatting, client.name) then
    buf_set_keymap("n", "<leader>lf", function()
      vim.lsp.buf.format {async = true}
    end)
    buf_set_keymap("v", "<leader>lf", "<Cmd>lua vim.lsp.buf.range_formatting()<CR><ESC>")
  end
  -- stylua: ignore end
end

return { hover = hover, open_floating_preview = open_floating_preview, on_attach = on_attach }
