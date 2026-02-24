-- typescript.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "SmiteshP/nvim-navic",
      "lewis6991/gitsigns.nvim",
    },
    opts = {
      servers = {
        ts_ls = { enabled = false },
        vtsls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          root_markers = { "tsconfig.json", "tsconfig.base.json", "package.json", ".git" },
          init_options = {
            maxTsServerMemory = 8192,
          },
          on_attach = function(client, bufnr)
            -- Setup navic
            if client.server_capabilities.documentSymbolProvider then
              require("nvim-navic").attach(client, bufnr)
            end

            -- Filter out "Could not find source file" errors from documentHighlight
            -- These are race conditions during TS server indexing in large Angular projects
            local default_handler = vim.lsp.handlers["textDocument/documentHighlight"]
            vim.lsp.handlers["textDocument/documentHighlight"] = function(err, result, ctx, config)
              if err then
                -- Suppress specific race condition errors
                if err.message and err.message:match("Could not find source file") then
                  return
                end
                -- Show other real errors
                vim.notify(
                  string.format("Document highlight error: %s", err.message or "Unknown error"),
                  vim.log.levels.WARN
                )
                return
              end
              -- Delegate to default handler when successful
              if default_handler then
                default_handler(err, result, ctx, config)
              end
            end
          end,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              },
            },
            vtsls = {
              -- Use workspace TypeScript for better compatibility with project
              autoUseWorkspaceTsdk = true,
            },
          },
        },
      },
    },
  },
  {
    "dmmulroy/tsc.nvim",
    config = true,
    cmd = "TSC",
    keys = {
      { "<leader>tc", "<cmd>TSC<cr>", desc = "Type-check" },
    },
  },
  {
    "SmiteshP/nvim-navic",
    config = function()
      require("nvim-navic").setup({})
    end,
  },
}
