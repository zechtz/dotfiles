return {
  "lunarvim/tokyonight.nvim",
  {
    "LazyVim/LazyVim",
    lazy = false, -- make sure we load this during startup because its our main colorscheme
    priority = 1000, -- make sure we run this before other startup plugins
    opts = {
      italic_comments = true,
      -- colorscheme = "tokyonight",
      style = "moon",
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
        transparent = false, --lualine center bar transparency
      },
      colors = {}, -- override default colors
      highlights = {}, -- override highlights groups

      diagnostics = {
        darker = true, -- darker colors for diagnostics
        undercurl = true, -- use udnercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    },
  },
}
