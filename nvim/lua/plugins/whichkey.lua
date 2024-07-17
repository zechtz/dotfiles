return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    defaults = {
      { "<leader>v", "<cmd>vsplit<cr>", desc = "Vertical Split", mode = "n" },
      { "<leader>h", "<cmd>split<cr>", desc = "Horizontal Split", mode = "n" },
      {
        -- Nested mappings are allowed and can be added in any order
        -- Most attributes can be inherited or overridden on any level
        -- There's no limit to the depth of nesting
        mode = { "n", "v" }, -- NORMAL and VISUAL mode
        {
          "<leader>H",
          "",
          desc = "Harpoon",
          {
            "<leader>Hu",
            "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
            desc = "Open Harpoon UI",
          },
          { "<leader>Ha", "<cmd> lua require('harpoon.mark').add_file()<CR>", desc = "Add To Harpoon" },
          { "<leader>Hn", "<cmd> lua require('harpoon.ui').nav_next()<CR>", desc = "Next File" },
          { "<leader>Hp", "<cmd> lua require('harpoon.ui').nav_prev()<CR>", desc = "Prev File" },
        }, -- no need to specify mode since it's inherited
        {
          "<leader>o",
          "",
          desc = "Options",
          {
            "<leader>oc",
            "<cmd>lua vim.g.cmp_active=false<cr>",
            desc = "Completion off",
          },
          {
            "<leader>oC",
            "<cmd>lua vim.g.cmp_active=true<cr>",
            desc = "Completion on",
          },
          {
            "<leader>ow",
            '<cmd>lua require("config.functions").toggle_option("wrap")<cr>',
            desc = "Wrap",
          },
          {
            "<leader>or",
            '<cmd>lua require("config.functions").toggle_option("relativenumber")<cr>',
            desc = "Relative",
          },
          {
            "<leader>ol",
            '<cmd>lua require("config.functions").toggle_option("cursorline")<cr>',
            desc = "Cursorline",
          },
          {
            "<leader>os",
            '<cmd>lua require("config.functions").toggle_option("spell")<cr>',
            desc = "Spell",
          },
          {
            "<leader>ot",
            '<cmd>lua require("config.functions").toggle_tabline()<cr>',
            desc = "Tabline",
          },
        },
        {
          "<leader>l",
          "",
          desc = "LSPs",
          {
            "<leader>la",
            "<cmd>lua vim.lsp.buf.code_action()<cr>",
            desc = "Code Action",
          },
          {
            "<leader>lc",
            "<cmd>lua require('plugins.lsp').server_capabilities()<cr>",
            desc = "Get Capabilities",
          },
          {
            "<leader>ld",
            "<cmd>TroubleToggle<cr>",
            desc = "Diagnostics",
          },
          {
            "<leader>lw",
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            desc = "Workspace Diagnostics",
          },
          {
            "<leader>lf",
            "<cmd>lua vim.lsp.buf.format({ async = true })<cr>",
            desc = "Format",
          },
          {
            "<leader>lF",
            "<cmd>LspToggleAutoFormat<cr>",
            desc = "Toggle Autoformat",
          },
          {
            "<leader>li",
            "<cmd>LspInfo<cr>",
            desc = "Info",
          },
          {
            "<leader>lh",
            '<cmd>lua require("config.functions").toggle_inlay_hints()<cr>',
            desc = "Toggle Inlay Hints",
          },
          {
            "<leader>lH",
            "<cmd>IlluminationToggle<cr>",
            desc = "Toggle Doc HL",
          },
          {
            "<leader>lI",
            "<cmd>LspInstallInfo<cr>",
            desc = "Installer Info",
          },
          {
            "<leader>lj",
            "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
            desc = "Next Diagnostic",
          },
          {
            "<leader>lk",
            "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
            desc = "Prev Diagnostic",
          },
          {
            "<leader>lv",
            "<cmd>lua require('lsp_lines').toggle()<cr>",
            desc = "Virtual Text",
          },
          {
            "<leader>ll",
            "<cmd>lua vim.lsp.codelens.run()<cr>",
            desc = "CodeLens Action",
          },
          {
            "<leader>lo",
            "<cmd>SymbolsOutline<cr>",
            desc = "Outline",
          },
          {
            "<leader>lq",
            "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",
            desc = "Quickfix",
          },
          {
            "<leader>lr",
            "<cmd>lua vim.lsp.buf.rename()<cr>",
            desc = "Rename",
          },
          {
            "<leader>lR",
            "<cmd>TroubleToggle lsp_references<cr>",
            desc = "References",
          },
          {
            "<leader>ls",
            "<cmd>Telescope lsp_document_symbols<cr>",
            desc = "Document Symbols",
          },
          {
            "<leader>lS",
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            desc = "Workspace Symbols",
          },
          {
            "<leader>lt",
            '<cmd>lua require("config.functions").toggle_diagnostics()<cr>',
            desc = "Toggle Diagnostics",
          },
          {
            "<leader>lu",
            "<cmd>LuaSnipUnlinkCurrent<cr>",
            desc = "Unlink Snippet",
          },
        },
      },
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    ---@class wk.Opts
    ---@type false | "classic" | "modern" | "helix"
    preset = "classic",
    -- Delay before showing the popup. Can be a number or a function that returns a number.
    ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    ---@param mapping wk.Mapping
    filter = function(mapping)
      -- example to exclude mappings without a description
      -- return mapping.desc and mapping.desc ~= ""
      return true
    end,
    --- You can add any mappings here, or use `require('which-key').add()` later
    ---@type wk.Spec
    spec = {
      {
        mode = { "n", "v" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>q", group = "quit/session" },
        { "<leader>s", group = "search" },
        { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
        { "<leader>w", group = "windows" },
        { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gs", group = "surround" },
        { "z", group = "fold" },
      },
    },
    -- show a warning when issues were detected with your mappings
    notify = true,
    -- Enable/disable WhichKey for certain mapping modes
    modes = {
      n = true, -- Normal mode
      i = false, -- Insert mode
      x = true, -- Visual mode
      s = true, -- Select mode
      o = true, -- Operator pending mode
      t = true, -- Terminal mode
      c = true, -- Command mode
      -- Start hidden and wait for a key to be pressed before showing the popup
      -- Only used by enabled xo mapping modes.
      -- Set to false to show the popup immediately (after the delay)
      defer = {
        ["<C-V>"] = true,
        V = true,
      },
    },
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    ---@type wk.Win.opts
    win = {
      -- don't allow the popup to overlap with the cursor
      no_overlap = true,
      -- width = 1,
      -- height = { min = 4, max = 25 },
      -- col = 0,
      -- row = math.huge,
      border = "rounded",
      padding = { 2, 2, 2, 2 }, -- extra window padding [top/bottom, right/left]
      title = true,
      title_pos = "center",
      zindex = 1000,
      -- Additional vim.wo and vim.bo options
      bo = {},
      wo = {
        winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      },
    },
    layout = {
      width = { min = 20 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    keys = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    ---@type (string|wk.Sorter)[]
    --- Mappings are sorted using configured sorters and natural sort of the keys
    --- Available sorters:
    --- * local: buffer-local mappings first
    --- * order: order of the items (Used by plugins like marks / registers)
    --- * group: groups last
    --- * alphanum: alpha-numerical first
    --- * mod: special modifier keys last
    --- * manual: the order the mappings were added
    --- * case: lower-case first
    sort = { "local", "order", "group", "alphanum", "mod" },
    ---@type number|fun(node: wk.Node):boolean?
    expand = 0, -- expand groups when <= n mappings
    -- expand = function(node)
    --   return not node.desc -- expand all nodes without a description
    -- end,
    ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
        -- { "<Space>", "SPC" },
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
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
      ellipsis = "…",
      --- See `lua/which-key/icons.lua` for more details
      --- Set to `false` to disable keymap icons
      ---@type wk.IconRule[]|false
      rules = {},
      -- use the highlights from mini.icons
      -- When `false`, it will use `WhichKeyIcon` instead
      colors = true,
      -- used by key format
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
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    -- Which-key automatically sets up triggers for your mappings.
    -- But you can disable this and setup the triggers yourself.
    -- Be aware, that triggers are not needed for visual and operator pending mode.
    triggers = true, -- automatically setup triggers
    disable = {
      -- disable WhichKey for certain buf types and file types.
      ft = {},
      bt = {},
      -- disable a trigger for a certain context by returning true
      ---@type fun(ctx: { keys: string, mode: string, plugin?: string }):boolean?
      trigger = function(ctx)
        return false
      end,
    },
    debug = false, -- enable wk.log in the current directory
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
    if not vim.tbl_isempty(opts.defaults) then
      LazyVim.warn("which-key: opts.defaults is deprecated. Please use opts.spec instead.")
      wk.add(opts.defaults)
    end
  end,
}
