return {
  -- Darkplus colorscheme
  {
    "lunarvim/darkplus.nvim",
    lazy = false, -- Load during startup
    priority = 1000, -- Load before other plugins
    config = function()
      vim.cmd("colorscheme darkplus") -- Set the colorscheme to darkplus
    end,
  },

  -- LazyVim configuration
  {
    "LazyVim/LazyVim",
    lazy = false, -- Ensure LazyVim loads during startup
    priority = 1000, -- Ensure LazyVim runs before other startup plugins
    opts = {
      italic_comments = true,
      colorscheme = "tokyonight", -- Default colorscheme if darkplus is not used
      style = "darker",
      transparent = false,
      term_colors = true,
      ending_tilders = false,
      cmp_itemkind_reverse = false,
      toggle_style_key = nil,
      toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
      lualine = {
        transparent = true, -- Lualine center bar transparency
      },
      colors = {}, -- Override default colors
      highlights = {}, -- Override highlights groups
      diagnostics = {
        darker = true, -- Darker colors for diagnostics
        undercurl = true, -- Use undercurl instead of underline for diagnostics
        background = true, -- Use background color for virtual text
      },
    },
  },
  -- indent-blankline.nvim configuration
}
