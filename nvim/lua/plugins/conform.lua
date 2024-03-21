return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      -- Use a sub-list to run only the first available formatter
      javascript = { { "prettierd", "prettier" } },
      python = { "isort", "black" },
      -- java = { "google-java-format" },
      htmldjango = { "djlint" },
    },
  },
}
