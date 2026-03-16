return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "moon",       -- default dark variant
    light_style = "day",  -- used when background=light
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = false },
      functions = {},
      variables = {},
    },
    sidebars = { "qf", "help" },
    day_brightness = 0.3,
    lualine_bold = true,
  },
}
