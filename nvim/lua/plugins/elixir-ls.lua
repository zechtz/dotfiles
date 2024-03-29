return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup({

      nextls = {
        enable = true,                                             -- defaults to false
        cmd = "/home/mtabe/.cache/elixir-tools/nextls/bin/nextls", -- path to the executable. mutually exclusive with `port`
        init_options = {
          mix_env = "dev",
          mix_target = "host",
        },
        on_attach = function(client, bufnr)
          -- custom keybinds
        end,
      },
      credo = {
        enable = true, -- defaults to true
      },
      elixirls = {
        -- default settings, use the `settings` function to override settings
        settings = elixirls.settings({
          dialyzerEnabled = true,
          fetchDeps = false,
          enableTestLenses = false,
          suggestSpecs = false,
        }),
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        end,
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local mason = (os.getenv("HOME") or "") .. "/.local/share/nvim/mason"
      local dap = require("dap")

      dap.adapters.elixir = {
        type = "executable",
        command = mason .. "/packages/elixir-ls/debugger.sh",
      }

      dap.configurations.elixir = {
        {
          type = "elixir",
          name = "Run Elixir Program",
          task = "phx.server",
          taskArgs = { "--trace" },
          request = "launch",
          startApps = true, -- for Phoenix projects
          projectDir = "${workspaceFolder}",
          requireFiles = {
            "test/**/test_helper.exs",
            "test/**/*_test.exs",
          },
        },
      }
    end,
  },
}
