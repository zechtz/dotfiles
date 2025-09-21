return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Remove navic from the statusline (lualine_c) if it's there
      local navic = nil
      for i, component in ipairs(opts.sections.lualine_c) do
        if type(component) == "table" and component[1] == "navic" then
          navic = table.remove(opts.sections.lualine_c, i)
          break
        end
      end

      -- Add navic to the winbar
      opts.winbar = opts.winbar or {}
      opts.winbar.lualine_c = opts.winbar.lualine_c or {}
      table.insert(opts.winbar.lualine_c, {
        "navic",
        -- Optional: Component-specific options for navic
        color_correction = "dynamic", -- or "static" or nil
        navic_opts = {
          highlight = true, -- Enable highlight groups for icons and text
          depth_limit = 5, -- Limit the depth of context shown
          separator = " > ", -- Customize the separator
        },
      })

      -- Optional: Disable winbar for specific filetypes
      opts.options = opts.options or {}
      opts.options.disabled_filetypes = opts.options.disabled_filetypes or {}
      opts.options.disabled_filetypes.winbar = { "dashboard", "lazy", "alpha" }

      return opts
    end,
  },

  -- Optional: Customize nvim-navic settings
  {
    "SmiteshP/nvim-navic",
    opts = {
      highlight = true, -- Enable highlight groups for icons and text
      depth_limit = 5, -- Maximum depth of context
      depth_limit_indicator = "..", -- Indicator when depth limit is hit
      separator = " > ", -- Separator between context elements
      safe_output = true, -- Sanitize output for winbar
      click = true, -- Enable clicking to navigate to elements
    },
  },
}
