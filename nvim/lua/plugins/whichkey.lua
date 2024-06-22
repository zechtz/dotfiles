return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "center", -- align columns left, center or right
    },
    prefix = "<leader>",
    defaults = {
      mode = { "n", "v" },
      ["<leader>a"] = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
      ["<leader>v"] = { "<cmd>vsplit<cr>", "vsplit" },
      ["<leader>h"] = { "<cmd>split<cr>", "split" },
      ["<leader>X"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
      ["g"] = { name = "+goto" },
      ["gz"] = { name = "+surround" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader><tab>"] = { name = "+tabs" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>gh"] = { name = "+hunks" },
      ["<leader>q"] = { name = "+quit/session" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>uu"] = {
        "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
        "Open Harpoon UI",
        { noremap = true, silent = true },
      },
      ["<leader>w"] = { name = "+windows" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },

      ["<leader>g"] = {
        name = "Git",
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        b = { "<cmd>GitBlameToggle<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        h = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        s = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
        G = {
          name = "Gist",
          a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
          d = { "<cmd>Gist -d<cr>", "Delete" },
          f = { "<cmd>Gist -f<cr>", "Fork" },
          g = { "<cmd>Gist -b<cr>", "Create" },
          l = { "<cmd>Gist -l<cr>", "List" },
          p = { "<cmd>Gist -b -p<cr>", "Create Private" },
        },
      },

      -- older me will probably hate this, i should group this like others
      ["<leader>H"] = {
        name = "Harpoon",
        u = {
          "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
          "Open Harpoon UI",
          { noremap = true, silent = true },
        },
        a = { "<cmd> lua require('harpoon.mark').add_file()<CR>", "Add To Harpoon", { noremap = true, silent = true } },
        n = { "<cmd> lua require('harpoon.ui').nav_next()<CR>", "Next File", { noremap = true, silent = true } },
        p = { "<cmd> lua require('harpoon.ui').nav_prev()<CR>", "Prev File", { noremap = true, silent = true } },
      },
      ["<leader>/"] = {
        name = "Find",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
        s = { "<cmd>Telescope grep_string<cr>", "Find String" },
        h = { "<cmd>Telescope help_tags<cr>", "Help" },
        H = { "<cmd>Telescope highlights<cr>", "Highlights" },
        i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
        l = { "<cmd>Telescope resume<cr>", "Last Search" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
      },
      ["<leader>B"] = {
        name = "Browse",
        i = { "<cmd>BrowseInputSearch<cr>", "Input Search" },
        b = { "<cmd>Browse<cr>", "Browse" },
        d = { "<cmd>BrowseDevdocsSearch<cr>", "Devdocs" },
        f = { "<cmd>BrowseDevdocsFiletypeSearch<cr>", "Devdocs Filetype" },
        m = { "<cmd>BrowseMdnSearch<cr>", "Mdn" },
      },
      ["<leader>o"] = {
        name = "Options",
        c = { "<cmd>lua vim.g.cmp_active=false<cr>", "Completion off" },
        C = { "<cmd>lua vim.g.cmp_active=true<cr>", "Completion on" },
        w = { '<cmd>lua require("config.functions").toggle_option("wrap")<cr>', "Wrap" },
        r = { '<cmd>lua require("config.functions").toggle_option("relativenumber")<cr>', "Relative" },
        l = { '<cmd>lua require("config.functions").toggle_option("cursorline")<cr>', "Cursorline" },
        s = { '<cmd>lua require("config.functions").toggle_option("spell")<cr>', "Spell" },
        t = { '<cmd>lua require("config.functions").toggle_tabline()<cr>', "Tabline" },
      },
      ["<leader>l"] = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        c = { "<cmd>lua require('plugins.lsp').server_capabilities()<cr>", "Get Capabilities" },
        d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
        w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
        f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
        F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        h = { '<cmd>lua require("config.functions").toggle_inlay_hints()<cr>', "Toggle Inlay Hints" },
        H = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", "Next Diagnostic" },
        k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Prev Diagnostic" },
        v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        o = { "<cmd>SymbolsOutline<cr>", "Outline" },
        q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
        t = { '<cmd>lua require("config.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
        u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
      },
      ["<leader>d"] = {
        name = "Debug",
        b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
        O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
        l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
        u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
        x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
      },
      ["<leader>t"] = {
        name = "Terminal",
        ["1"] = { ":1ToggleTerm<cr>", "1" },
        ["2"] = { ":2ToggleTerm<cr>", "2" },
        ["3"] = { ":3ToggleTerm<cr>", "3" },
        ["4"] = { ":4ToggleTerm<cr>", "4" },
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
        u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
        t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
      },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
