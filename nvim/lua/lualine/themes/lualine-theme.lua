-- Function to detect current theme
local function get_colorscheme()
  return vim.g.colors_name or "darkplus"
end

-- Dark theme colors (darkplus)
local dark_colors = {
  blue = "#569cd6",
  green = "#6a9955",
  purple = "#c586c0",
  red = "#d16969",
  yellow = "#dcdcaa",
  orange = "#D7BA7D",
  fg = "#ababab",
  bg = "#181818",
  gray = "#2d2d2d",
  gray3 = "#3e4452",
}

-- Light theme colors (catppuccin-latte)
local light_colors = {
  blue = "#1e66f5",
  green = "#40a02b",
  purple = "#8839ef",
  red = "#d20f39",
  yellow = "#df8e1d",
  orange = "#fe640b",
  fg = "#4c4f69",
  bg = "#eff1f5",
  gray = "#dce0e8",
  gray3 = "#9ca0b0",
}

-- Function to get current colors based on colorscheme
local function get_colors()
  local colorscheme = get_colorscheme()
  if colorscheme == "catppuccin-latte" or colorscheme == "catppuccin" then
    return light_colors
  else
    return dark_colors
  end
end

-- Function to create theme
local function create_theme()
  local colors = get_colors()

  return {
    normal = {
      a = { fg = colors.bg, bg = colors.blue },
      b = { fg = colors.blue, bg = colors.gray },
      c = { fg = colors.fg, bg = colors.bg },
    },
    insert = {
      a = { fg = colors.bg, bg = colors.green },
      b = { fg = colors.green, bg = colors.gray },
    },
    visual = {
      a = { fg = colors.bg, bg = colors.purple },
      b = { fg = colors.purple, bg = colors.gray },
    },
    command = {
      a = { fg = colors.bg, bg = colors.orange },
      b = { fg = colors.orange, bg = colors.gray },
    },
    replace = {
      a = { fg = colors.bg, bg = colors.red },
      b = { fg = colors.red, bg = colors.gray },
    },
    inactive = {
      a = { bg = colors.bg, fg = colors.blue },
      b = { bg = colors.bg, fg = colors.gray3, gui = "bold" },
      c = { bg = colors.bg, fg = colors.gray3 },
    },
  }
end

-- Return the dynamic theme
return create_theme()
