return {
  "ruifm/gitlinker.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = {
    callbacks = {
      ["git.comcast.com"] = require("gitlinker.hosts").get_github_type_url,
    },
    -- remote = 'github', -- force the use of a specific remote
    -- adds current line nr in the url for normal mode
    add_current_line_on_normal_mode = true,
    -- callback for what to do with the url
    action_callback = require("gitlinker.actions").open_in_browser,
    -- print the url after performing the action
    print_url = false,
    -- mapping to call url generation
    mappings = "<leader>gy",
  },

  config = function(_, opts)
    require("gitlinker").setup(opts)
  end,
}
