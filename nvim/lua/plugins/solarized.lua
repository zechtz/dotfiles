return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = false,
    palette = "solarized", -- "solarized" or "selenized"
    styles = {
      comments = { italic = true },
      keywords = { italic = false },
      functions = {},
      variables = {},
    },
    on_highlights = function(colors, color)
      return {}
    end,
  },
}
