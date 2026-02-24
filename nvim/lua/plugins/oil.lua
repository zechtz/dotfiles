return {
  "stevearc/oil.nvim",
  -- Put all settings here
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      natural_order = true,
      is_always_hidden = function(name, _)
        return name:match("^%.") or name:match("^__") or name:match("^%d+%.")
      end,
    },
    win_options = {
      wrap = true,
      signcolumn = "yes:2",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
    require("oil").setup(opts) -- This pulls in everything from 'opts' above

    vim.keymap.set("n", "<leader>o", function()
      if vim.bo.filetype == "oil" then
        require("oil").close()
      else
        vim.cmd("Oil") -- Fixed: Capital 'O'
      end
    end, { desc = "Toggle Oil" })
  end,
}
