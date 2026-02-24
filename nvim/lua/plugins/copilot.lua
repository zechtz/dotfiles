return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    -- Manual start only (removed event = "InsertEnter")
    keys = {
      { "<leader>cp", "<cmd>Copilot attach<cr>", desc = "Start Copilot" },
      { "<leader>cd", "<cmd>Copilot detach<cr>", desc = "Stop Copilot" },
    },
    enabled = true,
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_next = "<c-n>",
            jump_prev = "<c-p>",
            accept = "<c-l>",
            refresh = "r",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<c-a>",
            accept_word = false,
            accept_line = false,
            next = "<c-j>",
            prev = "<c-k>",
            dismiss = "<C-e>",
          },
        },
      })
    end,
  },
}
