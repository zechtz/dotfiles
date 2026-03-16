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
      local is_catppuccin = colors_name:find("catppuccin")
      local is_tokyonight = colors_name:find("tokyonight")

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
        custom_theme = require("catppuccin.utils.lualine")()
        custom_theme.normal.b.fg = "#cad3f5"
        custom_theme.insert.b.fg = "#cad3f5"
        custom_theme.visual.b.fg = "#cad3f5"
        custom_theme.replace.b.fg = "#cad3f5"
        custom_theme.command.b.fg = "#cad3f5"
        custom_theme.inactive.b.fg = "#cad3f5"
        custom_theme.normal.c.fg = "#6e738d"
        custom_theme.normal.c.bg = "#1e2030"
      end

      require("lualine").setup({
        options = {
          theme = custom_theme,
          component_separators = "",
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "alpha", "Outline" },
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
        extensions = { "toggleterm", "trouble" },
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
