return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          -- Explicitly define filetypes to include
          filetypes = { "html", "css", "javascript", "typescript", "eruby", "heex", "html-eex", "ex" },
          -- Optional: Exclude filetypes if needed
          filetypes_exclude = {},
          -- Define root directory patterns
          root_dir = require("lspconfig.util").root_pattern(
            "tailwind.config.js",
            "tailwind.config.ts",
            "package.json",
            ".git",
            "mix.exs"
          ) or vim.fn.getcwd(),
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  "@?class\\(([^]*)\\)",
                  "'([^']*)'",
                },
              },
            },
          },
        },
      },
      setup = {
        tailwindcss = function(_, opts)
          require("lspconfig").tailwindcss.setup(opts)
        end,
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" }, -- Enable for all filetypes, including .ex
        user_default_options = {
          tailwind = true, -- Enable Tailwind CSS color detection
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- Add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["elixir"] = { "mix" }, -- Elixir formatting
        ["html"] = { "prettier" },
        ["heex"] = { "prettier" },
        ["html-eex"] = { "prettier" },
        ["ex"] = { "prettier" }, -- Add Prettier for .ex files
      },
      formatters = {
        prettier = {
          extra_args = { "--plugin", "prettier-plugin-tailwindcss" },
        },
      },
    },
  },
}
