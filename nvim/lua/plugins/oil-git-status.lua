return {
  "refractalize/oil-git-status.nvim",

  dependencies = {
    "stevearc/oil.nvim",
  },

  config = function()
    require("oil-git-status").setup({
      show_ignored = true, -- Show files that match gitignore with !!
      symbols = {
        index = {
          ["!"] = "", -- Ignored
          ["?"] = "", -- Untracked
          ["A"] = "", -- Added
          ["C"] = "", -- Copied
          ["D"] = "", -- Deleted
          ["M"] = "", -- Modified
          ["R"] = "", -- Renamed
          ["T"] = "", -- TypeChanged
          ["U"] = "", -- Unmerged
          [" "] = " ", -- Unmodified
        },
        working_tree = {
          ["!"] = "", -- Ignored
          ["?"] = "", -- Untracked
          ["A"] = "", -- Added
          ["C"] = "", -- Copied
          ["D"] = "", -- Deleted
          ["M"] = "", -- Modified
          ["R"] = "", -- Renamed
          ["T"] = "", -- TypeChanged
          ["U"] = "", -- Unmerged
          [" "] = " ", -- Unmodified
        },
      },
    })
  end,
}
