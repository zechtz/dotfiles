return {
  -- Auto dark mode plugin
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        -- Use tokyonight-night instead of darkplus for better compatibility
        vim.cmd("colorscheme darkplus")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd("colorscheme darkplus")
      end,
      fallback = "dark",
    },
  },

  {
    "lunarvim/darkplus.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      italic_comments = true,
      colorscheme = "darkplus", -- Default colorscheme if darkplus is not used
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

  -- Install catppuccin theme (fixed typo)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "latte", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        telescope = {
          enabled = true,
        },
        which_key = true,
      },
    },
  }, -- Configure LazyVim to not set a default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- Let auto-dark-mode handle the colorscheme
      colorscheme = function() end,
    },
  },
}
