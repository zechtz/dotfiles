return {
  -- Phpactor setup (disabled for Laravel projects)
  {
    "phpactor/phpactor",
    ft = { "php" },
    event = "VeryLazy",
    config = function()
      vim.g.phpactorCompletionIgnoreCase = true
    end,
    keys = {
      { "<leader>p", ":PhpactorContextMenu<CR>", desc = "Phpactor context menu" },
    },
    -- Disable phpactor for Laravel projects
    enabled = function()
      local composer_json = vim.fn.findfile("composer.json", vim.fn.getcwd() .. ";")
      if composer_json == "" then
        return true -- Enable phpactor if not in a Composer project
      end
      local content = vim.fn.readfile(composer_json)
      for _, line in ipairs(content) do
        if line:match('"laravel/framework"') then
          return false -- Disable phpactor in Laravel projects
        end
      end
      return true -- Enable phpactor for non-Laravel projects
    end,
  },

  -- Ensure intelephense is installed via mason.nvim
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "intelephense")
    end,
  },

  -- Configure nvim-lspconfig to use intelephense for Laravel projects
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          filetypes = { "php" },
          settings = {
            intelephense = {
              stubs = {
                "laravel",
                "eloquent",
                "core",
                "dom",
                "mbstring",
                "mysqli",
                "openssl",
                "pdo",
                "redis",
                "standard",
                "wordpress",
              },
            },
          },
          -- Enable intelephense only for Laravel projects
          enabled = function()
            local composer_json = vim.fn.findfile("composer.json", vim.fn.getcwd() .. ";")
            if composer_json == "" then
              return false -- Disable intelephense if not in a Composer project
            end
            local content = vim.fn.readfile(composer_json)
            for _, line in ipairs(content) do
              if line:match('"laravel/framework"') then
                return true -- Enable intelephense in Laravel projects
              end
            end
            return false -- Disable intelephense for non-Laravel projects
          end,
        },
        phpactor = {
          -- Ensure phpactor is disabled for Laravel projects
          enabled = function()
            local composer_json = vim.fn.findfile("composer.json", vim.fn.getcwd() .. ";")
            if composer_json == "" then
              return true -- Enable phpactor if not in a Composer project
            end
            local content = vim.fn.readfile(composer_json)
            for _, line in ipairs(content) do
              if line:match('"laravel/framework"') then
                return false -- Disable phpactor in Laravel projects
              end
            end
            return true -- Enable phpactor for non-Laravel projects
          end,
        },
      },
    },
  },
}
