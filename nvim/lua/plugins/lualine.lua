return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local clients_lsp = function()
      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return ""
      end

      local c = {}
      for _, client in pairs(clients) do
        table.insert(c, client.name)
      end
      return " " .. table.concat(c, "|")
    end

    local function setup_lualine()
      local colors_name = vim.g.colors_name or ""
      local is_catppuccin  = colors_name:find("catppuccin")
      local is_tokyonight  = colors_name:find("tokyonight")
      local is_gruvbox     = colors_name:find("gruvbox")
      local is_solarized   = colors_name:find("solarized")

      local custom_theme

      if is_tokyonight then
        local style = colors_name:match("tokyonight%-(.+)") or "moon"
        local ok_theme, tn_theme = pcall(require, "lualine.themes.tokyonight")
        custom_theme = ok_theme and vim.deepcopy(tn_theme) or require("catppuccin.utils.lualine")()

        local ok_colors, C = pcall(function()
          return require("tokyonight.colors").setup({ style = style })
        end)
        if ok_colors and C then
          local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
          for _, m in ipairs(modes) do
            if custom_theme[m] and custom_theme[m].c then
              custom_theme[m].c.bg = C.bg
              custom_theme[m].c.fg = C.fg_dark
            end
          end
          vim.schedule(function()
            vim.api.nvim_set_hl(0, "StatusLine", { bg = C.bg, fg = C.fg })
            vim.api.nvim_set_hl(0, "StatusLineNC", { bg = C.bg, fg = C.fg_dark })
          end)
        end

      elseif is_gruvbox then
        local ok_theme, gruvbox_theme = pcall(require, "lualine.themes.gruvbox")
        custom_theme = ok_theme and vim.deepcopy(gruvbox_theme) or require("catppuccin.utils.lualine")()

        local is_light = vim.o.background == "light"
        local contrast = ""
        local ok_cfg, gruvbox_cfg = pcall(function() return require("gruvbox").config end)
        if ok_cfg and gruvbox_cfg then contrast = gruvbox_cfg.contrast or "" end

        local bg_dark  = { hard = "#1d2021", soft = "#32302f", [""] = "#282828" }
        local bg_light = { hard = "#f9f5d7", soft = "#f2e5bc", [""] = "#fbf1c7" }
        local bg = (is_light and bg_light or bg_dark)[contrast] or (is_light and "#fbf1c7" or "#282828")
        local fg     = is_light and "#3c3836" or "#ebdbb2"
        local fg_dim = is_light and "#7c6f64" or "#a89984"

        local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
        for _, m in ipairs(modes) do
          if custom_theme[m] and custom_theme[m].c then
            custom_theme[m].c.bg = bg
            custom_theme[m].c.fg = fg
          end
        end
        vim.schedule(function()
          vim.api.nvim_set_hl(0, "StatusLine", { bg = bg, fg = fg })
          vim.api.nvim_set_hl(0, "StatusLineNC", { bg = bg, fg = fg_dim })
        end)

      elseif is_solarized then
        -- Solarized has fixed palette values regardless of plugin.
        -- bg/fg differ only between dark and light variants.
        local is_light = vim.o.background == "light"
        local theme_name = is_light and "solarized_light" or "solarized_dark"
        local ok_theme, sol_theme = pcall(require, "lualine.themes." .. theme_name)
        custom_theme = ok_theme and vim.deepcopy(sol_theme) or require("catppuccin.utils.lualine")()

        local bg     = is_light and "#fdf6e3" or "#002b36"
        local fg     = is_light and "#657b83" or "#839496"
        local fg_dim = is_light and "#93a1a1" or "#586e75"

        local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
        for _, m in ipairs(modes) do
          if custom_theme[m] and custom_theme[m].c then
            custom_theme[m].c.bg = bg
            custom_theme[m].c.fg = fg
          end
        end
        vim.schedule(function()
          vim.api.nvim_set_hl(0, "StatusLine", { bg = bg, fg = fg })
          vim.api.nvim_set_hl(0, "StatusLineNC", { bg = bg, fg = fg_dim })
        end)

      elseif is_catppuccin then
        custom_theme = require("catppuccin.utils.lualine")()
        local C = require("catppuccin.palettes").get_palette()
        local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
        for _, m in ipairs(modes) do
          if custom_theme[m] and custom_theme[m].c then
            custom_theme[m].c.bg = C.base
            custom_theme[m].c.fg = C.text
          end
        end
        -- The dark spot comes from catppuccin setting StatusLine bg to a dark
        -- surface colour. Lualine uses StatusLine as the fallback bg for any
        -- padding or gap between the terminal edge and the first section, so
        -- it shows as a dark sliver. Match it to the editor background instead.
        vim.schedule(function()
          vim.api.nvim_set_hl(0, "StatusLine", { bg = C.base, fg = C.text })
          vim.api.nvim_set_hl(0, "StatusLineNC", { bg = C.base, fg = C.subtext0 })
        end)

      else
        -- darkplus and other themes: use catppuccin as structural base with custom colours.
        -- c.bg must match the actual editor background (#1e1e1e for darkplus) so section C
        -- blends seamlessly instead of showing a mismatched bar.
        custom_theme = require("catppuccin.utils.lualine")()
        local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
        for _, m in ipairs(modes) do
          if custom_theme[m] then
            if custom_theme[m].b then custom_theme[m].b.fg = "#cad3f5" end
            if custom_theme[m].c then
              custom_theme[m].c.bg = "#1e1e1e"
              custom_theme[m].c.fg = "#6e738d"
            end
          end
        end
        vim.schedule(function()
          vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1e1e1e", fg = "#d4d4d4" })
          vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1e1e1e", fg = "#6e738d" })
        end)
      end

      require("lualine").setup({
        options = {
          theme = custom_theme,
          component_separators = "",
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "alpha", "Outline" },
            winbar = { "alpha", "Outline", "dashboard", "lazy", "neo-tree", "toggleterm" },
          },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = " ", right = "" }, icon = "" },
          },
          lualine_b = {
            {
              "filetype",
              icon_only = true,
              padding = { left = 1, right = 0 },
            },
            "filename",
          },
          lualine_c = {
            {
              "branch",
              icon = "",
            },
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
              colored = false,
            },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              update_in_insert = true,
            },
          },
          lualine_y = { clients_lsp },
          lualine_z = {
            { "location", separator = { left = "", right = " " }, icon = "" },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        winbar = {
          lualine_c = {
            {
              "navic",
              color_correction = "dynamic",
              navic_opts = {
                highlight = true,
                depth_limit = 5,
                separator = "  ",
              },
            },
          },
        },
        inactive_winbar = {
          lualine_c = { "filename" },
        },
        extensions = { "toggleterm", "trouble", "neo-tree" },
      })
    end

    setup_lualine()

    -- Re-run setup when colorscheme changes so all themes adapt correctly.
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = setup_lualine,
      desc = "Reload lualine theme on colorscheme change",
    })
  end,
}
