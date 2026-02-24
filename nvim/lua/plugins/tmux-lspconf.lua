return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tmux = {},
      },
      setup = {
        tmux = function()
          local lspconfig = require("lspconfig")
          local configs = require("lspconfig.configs")

          -- Add tmux as a custom server if not already defined
          if not configs.tmux then
            configs.tmux = {
              default_config = {
                cmd = { "tmux-language-server" },
                filetypes = { "tmux" },
                root_dir = lspconfig.util.root_pattern(".git", ".tmux.conf", "tmux.conf"),
                single_file_support = true,
              },
            }
          end

          -- Now setup the server
          lspconfig.tmux.setup({})
        end,
      },
    },
  },
}
