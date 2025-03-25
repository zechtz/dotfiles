local util = require("util")

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "folke/trouble.nvim",
    "simrat39/symbols-outline.nvim",
  },
  opts = {
    preset = "classic",
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    filter = function(mapping)
      return true
    end,
    notify = true,
    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = true, suggestions = 20 },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    win = {
      no_overlap = true,
      border = "rounded",
      padding = { 2, 2, 2, 2 },
      title = true,
      title_pos = "center",
      zindex = 1000,
      wo = { winblend = 0 },
    },
    layout = {
      width = { min = 20 },
      spacing = 3,
      align = "left",
    },
    keys = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    sort = { "local", "order", "group", "alphanum", "mod" },
    expand = 0,
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
      },
      desc = {
        { "<Plug>%((.*)%)", "%1" },
        { "^%+", "" },
        { "<[cC]md>", "" },
        { "<[cC][rR]>", "" },
        { "<[sS]ilent>", "" },
        { "^lua%s+", "" },
        { "^call%s+", "" },
        { "^:%s*", "" },
      },
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
      ellipsis = "…",
      rules = {},
      colors = true,
      keys = {
        Up = " ",
        Down = " ",
        Left = " ",
        Right = " ",
        C = "󰘴 ",
        M = "󰘵 ",
        S = "󰘶 ",
        CR = "󰌑 ",
        Esc = "󱊷 ",
        ScrollWheelDown = "󱕐 ",
        ScrollWheelUp = "󱕑 ",
        NL = "󰌑 ",
        BS = "⌫",
        Space = "󱁐 ",
        Tab = "󰌒 ",
        F1 = "󱊫",
        F2 = "󱊬",
        F3 = "󱊭",
        F4 = "󱊮",
        F5 = "󱊯",
        F6 = "󱊰",
        F7 = "󱊱",
        F8 = "󱊲",
        F9 = "󱊳",
        F10 = "󱊴",
        F11 = "󱊵",
        F12 = "󱊶",
      },
    },
    show_help = true,
    show_keys = true,
    triggers = { -- Replace deprecated `modes` and `disable.trigger`
      { "<auto>", mode = "nixsoct" }, -- Default trigger for all supported modes
    },
    disable = {
      ft = {},
      bt = {},
    },
    debug = false,
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps (which-key)",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Define mappings using wk.add()
    wk.add({
      -- Top-level groups for normal and visual modes
      { "<leader><tab>", group = "tabs", mode = { "n", "v" } },
      { "<leader>b", group = "buffer", mode = { "n", "v" } },
      { "<leader>c", group = "code", mode = { "n", "v" } },
      { "<leader>f", group = "file/find", mode = { "n", "v" } },
      { "<leader>g", group = "git", mode = { "n", "v" } },
      { "<leader>gh", group = "hunks", mode = { "n", "v" } },
      { "<leader>q", group = "quit/session", mode = { "n", "v" } },
      { "<leader>s", group = "search", mode = { "n", "v" } },
      { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" }, mode = { "n", "v" } },
      { "<leader>w", group = "windows", mode = { "n", "v" } },
      { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" }, mode = { "n", "v" } },
      { "[", group = "prev", mode = { "n", "v" } },
      { "]", group = "next", mode = { "n", "v" } },
      { "g", group = "goto", mode = { "n", "v" } },
      { "gs", group = "surround", mode = { "n", "v" } },
      { "z", group = "fold", mode = { "n", "v" } },

      -- Window splits
      { "<leader>v", "<cmd>vsplit<cr>", desc = "Vertical Split", mode = "n" },
      { "<leader>h", "<cmd>split<cr>", desc = "Horizontal Split", mode = "n" },

      -- Harpoon
      {
        "<leader>H",
        group = "Harpoon",
        mode = "n",
        {
          "<leader>Hu",
          "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
          desc = "Open Harpoon UI",
        },
        { "<leader>Ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add To Harpoon" },
        { "<leader>Hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Next File" },
        { "<leader>Hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Prev File" },
      },

      -- Folds
      {
        "<leader>z",
        group = "Folds",
        mode = "n",
        {
          "<leader>zff",
          function()
            util.close_text_object_folds("@function.outer")
          end,
          desc = "Close folds for functions",
        },
        {
          "<leader>zfc",
          function()
            util.close_text_object_folds("@class.outer")
          end,
          desc = "Close folds for classes",
        },
        {
          "<leader>z1",
          function()
            util.close_folds_with_level(1)
          end,
          desc = "Close folds with level 1",
        },
        {
          "<leader>z2",
          function()
            util.close_folds_with_level(2)
          end,
          desc = "Close folds with level 2",
        },
        {
          "<leader>z3",
          function()
            util.close_folds_with_level(3)
          end,
          desc = "Close folds with level 3",
        },
        {
          "<leader>z4",
          function()
            util.close_folds_with_level(4)
          end,
          desc = "Close folds with level 4",
        },
        {
          "<leader>zo1",
          function()
            util.open_folds_with_level(1)
          end,
          desc = "Open folds with level 1",
        },
        {
          "<leader>zo2",
          function()
            util.open_folds_with_level(2)
          end,
          desc = "Open folds with level 2",
        },
        {
          "<leader>zo3",
          function()
            util.open_folds_with_level(3)
          end,
          desc = "Open folds with level 3",
        },
        {
          "<leader>zo4",
          function()
            util.open_folds_with_level(4)
          end,
          desc = "Open folds with level 4",
        },
      },
      {
        "<leader>zcs",
        function()
          util.close_folds_in_selection()
        end,
        desc = "Close folds in selection",
        mode = "v",
      },
      {
        "<leader>zos",
        function()
          util.open_folds_in_selection()
        end,
        desc = "Open folds in selection",
        mode = "v",
      },

      -- Options
      {
        "<leader>o",
        group = "Options",
        mode = "n",
        { "<leader>oc", "<cmd>lua vim.g.cmp_active=false<cr>", desc = "Completion off" },
        { "<leader>oC", "<cmd>lua vim.g.cmp_active=true<cr>", desc = "Completion on" },
        { "<leader>ow", '<cmd>lua require("config.functions").toggle_option("wrap")<cr>', desc = "Wrap" },
        { "<leader>or", '<cmd>lua require("config.functions").toggle_option("relativenumber")<cr>', desc = "Relative" },
        { "<leader>ol", '<cmd>lua require("config.functions").toggle_option("cursorline")<cr>', desc = "Cursorline" },
        { "<leader>os", '<cmd>lua require("config.functions").toggle_option("spell")<cr>', desc = "Spell" },
        { "<leader>ot", '<cmd>lua require("config.functions").toggle_tabline()<cr>', desc = "Tabline" },
      },

      -- LSP
      {
        "<leader>l",
        group = "LSPs",
        mode = "n",
        { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
        { "<leader>lc", "<cmd>lua require('plugins.lsp').server_capabilities()<cr>", desc = "Get Capabilities" },
        { "<leader>ld", "<cmd>TroubleToggle<cr>", desc = "Diagnostics" },
        { "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
        { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
        { "<leader>lF", "<cmd>LspToggleAutoFormat<cr>", desc = "Toggle Autoformat" },
        { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
        { "<leader>lh", '<cmd>lua require("config.functions").toggle_inlay_hints()<cr>', desc = "Toggle Inlay Hints" },
        { "<leader>lH", "<cmd>IlluminationToggle<cr>", desc = "Toggle Doc HL" },
        { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
        { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", desc = "Next Diagnostic" },
        { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "Prev Diagnostic" },
        { "<leader>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Text" },
        { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
        { "<leader>lo", "<cmd>SymbolsOutline<cr>", desc = "Outline" },
        { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" },
        { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
        { "<leader>lR", "<cmd>TroubleToggle lsp_references<cr>", desc = "References" },
        { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
        { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
        { "<leader>lt", '<cmd>lua require("config.functions").toggle_diagnostics()<cr>', desc = "Toggle Diagnostics" },
        { "<leader>lu", "<cmd>LuaSnipUnlinkCurrent<cr>", desc = "Unlink Snippet" },
      },
    })
  end,
}
