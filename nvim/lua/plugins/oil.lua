return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function(_, opts)
    require("oil").setup({
      default_file_explorer = true,
      default_file_explorer_config = {
        view_options = {
          show_hidden = true,
        },
      },
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
    })

    -- Toggle Oil
    vim.keymap.set("n", "<leader>o", function()
      if vim.bo.filetype == "oil" then
        require("oil").close()
      else
        vim.cmd("Oil")
      end
    end, { desc = "Toggle Oil" })
  end,
}
