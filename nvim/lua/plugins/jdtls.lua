local home = os.getenv("HOME")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        jdtls = function()
          return true
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local on_attach = function(client, bufnr)
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, bufnr)
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
      local install_path = require("mason-registry").get_package("jdtls"):get_install_path()

      local config = {
        cmd = {
          install_path .. "/bin/jdtls",
          "--jvm-arg=-javaagent:" .. install_path .. "/lombok.jar",
          "-data",
          workspace_dir,
        },

        settings = {
          ["java.format.settings.url"] = home .. "/.config/nvim/formatters/java-google-formatter.xml",
          ["java.format.settings.profile"] = "GoogleStyle",
          java = {
            format = {
              settings = {
                url = home .. "/.config/nvim/formatters/java-google-formatter.xml",
                profile = "GoogleStyle",
              },
            },
            signatureHelp = { enabled = true },
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true },
            references = { includeDecompiledSources = true },
            contentProvider = { preferred = "fernflower" },
            completion = {
              favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
              },
              importOrder = {
                "java",
                "javax",
                "com",
                "co",
                "org",
              },
              filteredTypes = {
                "com.sun.*",
                "io.micrometer.shaded.*",
                "java.awt.*",
                "jdk.*",
                "sun.*",
              },
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
            codeGeneration = {
              toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
              },
              hashCodeEquals = {
                useJava7Objects = true,
              },
              useBlocks = true,
            },
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-11",
                  path = home .. "/.asdf/installs/java/openjdk-11",
                },
                {
                  name = "JavaSE-17",
                  path = home .. "/.asdf/installs/java/openjdk-17",
                },
              },
            },
          },
        },
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = vim.fs.dirname(
          vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]
        ),
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          require("jdtls").start_or_attach(config)
        end,
      })
    end,
  },
}
