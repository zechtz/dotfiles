local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  enabled = function()
    return LazyVim.pick.want() == "telescope"
  end,
  version = false, -- telescope did only one release, so use HEAD for now
  keys = {
    {
      "<leader>,",
      "<cmd>Telescope buffers sort_mru=true theme=dropdown previewer=false sort_lastused=true initial_mode=normal<cr>",
      desc = "Switch Buffer",
    },
  },
  opts = function()
    return {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        -- open files in the first window that is an actual file.
        -- use the current window if no other window is available.
        get_selection_window = function()
          local wins = vim.api.nvim_list_wins()
          table.insert(wins, 1, vim.api.nvim_get_current_win())
          for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].buftype == "" then
              return win
            end
          end
          return 0
        end,
        path_display = function(opts, path)
          local tail = require("telescope.utils").path_tail(path)
          local parts = vim.split(path, "/")
          local displayed = table.concat(vim.list_slice(parts, #parts - 2, #parts), "/")
          return displayed
        end,
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next, -- Add this line
            ["<C-k>"] = actions.move_selection_previous, -- Add this line
          },
          n = {
            ["q"] = actions.close,
            ["<C-j>"] = actions.move_selection_next, -- Add this line
            ["<C-k>"] = actions.move_selection_previous, -- Add this line
          },
        },
      },
    }
  end,
}
