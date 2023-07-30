local icons = require("user.icons")

local setup_opts = { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  sort = {
    sorter = "name",
    folders_first = true,
  },
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  on_attach = "default",
  remove_keymaps = false,
  select_prompts = false,
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":t",
    indent_markers = { enable = false, icons = { corner = "└ ", edge = "│ ", none = "  " } },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = { file = true, folder = true, folder_arrow = true, git = true },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = icons.ui.ArrowOpen,
          arrow_closed = icons.ui.ArrowClosed,
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = icons.diagnostics.Hint,
      info = icons.diagnostics.Information,
      warning = icons.diagnostics.Warning,
      error = icons.diagnostics.Error,
    },
  },
  update_focused_file = { enable = true, update_cwd = true, ignore_list = {} },
  git = { enable = true, ignore = true, timeout = 500 },
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {},
    },
    number = false,
    relativenumber = false,
  },
} -- END_DEFAULT_OPTS

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup(setup_opts)
  end,
}
