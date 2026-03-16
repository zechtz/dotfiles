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
      local custom_catppuccin = require("catppuccin.utils.lualine")()
      local is_catppuccin = (vim.g.colors_name or ""):find("catppuccin")

      -- Custom colours for non-catppuccin themes (darkplus etc).
      -- Skipped for catppuccin: its palette already provides readable mode-specific
      -- b.fg colours that work for both latte (light) and mocha (dark).
      if not is_catppuccin then
        custom_catppuccin.normal.b.fg = "#cad3f5"
        custom_catppuccin.insert.b.fg = "#cad3f5"
        custom_catppuccin.visual.b.fg = "#cad3f5"
        custom_catppuccin.replace.b.fg = "#cad3f5"
        custom_catppuccin.command.b.fg = "#cad3f5"
        custom_catppuccin.inactive.b.fg = "#cad3f5"

        custom_catppuccin.normal.c.fg = "#6e738d"
        custom_catppuccin.normal.c.bg = "#1e2030"
      else
        -- For catppuccin: fix section C to match the editor background.
        -- Also fix inactive so the separator left-cap bg is not dark (#1e2030),
        -- which shows as a dark spot before lualine_a on light themes.
        local C = require("catppuccin.palettes").get_palette()
        local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
        for _, m in ipairs(modes) do
          if custom_catppuccin[m] and custom_catppuccin[m].c then
            custom_catppuccin[m].c.bg = C.base
            custom_catppuccin[m].c.fg = C.text
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
      end

      require("lualine").setup({
        options = {
          theme = custom_catppuccin,
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

    -- Re-run setup when colorscheme changes so catppuccin latte/mocha
    -- both get the correct colours.
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = setup_lualine,
      desc = "Reload lualine theme on colorscheme change",
    })
  end,
}
