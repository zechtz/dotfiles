return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    cmp = { enabled = true, method = "getCompletionsCycling" },
    panel = { -- no config options yet
      enabled = true,
    },
    ft_disable = { "markdown" },
    -- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
    server_opts_overrides = {
      -- trace = "verbose",
      settings = {
        advanced = {
          -- listCount = 10, -- #completions for panel
          inlineSuggestCount = 3, -- #completions for getCompletions
        },
      },
    },
  },
}
