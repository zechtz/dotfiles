return {
  -- Tools
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "angular-language-server",
      })
    end,
  },

  -- LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      diagnostics = {
        virtual_text = false,
        underline = true,
        update_on_insert = true,
        severity_sort = true,
      },
      ---@type lspconfig.options
      servers = {
        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        html = {
          filetypes = { "html" },
          init_options = {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = {
              css = true,
              javascript = true,
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
        -- Add clangd with restricted filetypes (if you have it in your config)
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp" }, -- Explicitly exclude .proto
        },
        emmet_language_server = {
          filetypes = {
            "astro",
            "blade",
            "css",
            "eruby",
            "html",
            "heex",
            "ex",
            "htmldjango",
            "javascriptreact",
            "less",
            "pug",
            "sass",
            "scss",
            "svelte",
            "typescriptreact",
            "vue",
          },
        },
        -- Remove the jdtls = {} entry from here
      },
      setup = {
        protols = function()
          require("lspconfig").protols.setup({
            filetypes = { "proto" }, -- Ensure protols handles .proto files
            root_dir = require("lspconfig.util").root_pattern("proto", ".git", "mod"),
          })
        end,
        angularls = function()
          require("lspconfig").angularls.setup({
            filetypes = { "html", "htmlangular" },
            root_dir = require("lspconfig.util").root_pattern("angular.json", "project.json"),
            on_new_config = function(new_config, new_root_dir)
              new_config.cmd = vim.list_extend(new_config.cmd, {
                "--tsProbeLocations",
                new_root_dir .. "/node_modules",
                "--ngProbeLocations",
                new_root_dir .. "/node_modules/@angular/language-server/node_modules",
              })
            end,
            settings = {
              angular = {
                enable = true,
              },
            },
          })
        end,
      },
    },
  },

}
