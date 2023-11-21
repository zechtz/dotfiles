local home = os.getenv("HOME")

-- java lsp
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        -- disable jdtls config from lspconfig
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
      -- calculate workspace dir
      local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
      -- get the mason install path
      local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
      -- local debug_install_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()
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
                -- Use Google Java style guidelines for formatting
                -- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
                -- and place it in the ~/.local/share/eclipse directory
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
            contentProvider = { preferred = "fernflower" }, -- Use fernflower to decompile library code
            -- Specify any completion options
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
            -- Specify any options for organizing imports
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
            -- How code generation should act
            codeGeneration = {
              toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
              },
              hashCodeEquals = {
                useJava7Objects = true,
              },
              useBlocks = true,
            },

            -- If you are developing in projects with different Java versions, you need
            -- to tell eclipse.jdt.ls to use the location of the JDK for your Java version
            -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
            -- And search for `interface RuntimeOption`
            -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
            configuration = {
              -- runtimes = {
              --   {
              --     name = "JavaJDK-17",
              --     path = home .. "/.sdkman/candidates/java/current",
              --   },
              -- },
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
