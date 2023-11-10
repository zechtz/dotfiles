local home = os.getenv("HOME")

local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

if vim.fn.has("mac") == 1 then
  WORKSPACE_PATH = home .. "/workspace/"
  CONFIG = "mac"
elseif vim.fn.has("unix") == 1 then
  WORKSPACE_PATH = home .. "/workspace/"
  CONFIG = "linux"
else
  print("Unsupported system")
end

-- Find root of project
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "settings.gradle" }

local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = WORKSPACE_PATH .. project_name

return {
  "mfussenegger/nvim-jdtls",
  config = function()
    local jdtls = require("jdtls")

    -- File types that signify a Java project's root directory. This will be
    -- used by eclipse to determine what constitutes a workspace

    -- eclipse.jdt.ls stores project specific data within a folder. If you are working
    -- with multiple different projects, each project must use a dedicated data directory.
    -- This variable is used to configure eclipse to use the directory name of the
    -- current project found using the root_marker as the folder for project specific data.
    local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

    -- Helper function for creating keymaps
    function nnoremap(rhs, lhs, bufopts, desc)
      bufopts.desc = desc
      vim.keymap.set("n", rhs, lhs, bufopts)
    end

    -- The on_attach function is used to set key maps after the language server
    -- attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Regular Neovim LSP client keymappings
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      nnoremap("gD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
      nnoremap("gd", vim.lsp.buf.definition, bufopts, "Go to definition")
      nnoremap("gi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
      nnoremap("K", vim.lsp.buf.hover, bufopts, "Hover text")
      nnoremap("<C-k>", vim.lsp.buf.signature_help, bufopts, "Show signature")
      nnoremap("<space>wa", vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
      nnoremap("<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
      nnoremap("<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts, "List workspace folders")
      nnoremap("<space>D", vim.lsp.buf.type_definition, bufopts, "Go to type definition")
      nnoremap("<space>rn", vim.lsp.buf.rename, bufopts, "Rename")
      nnoremap("<space>ca", vim.lsp.buf.code_action, bufopts, "Code actions")
      vim.keymap.set(
        "v",
        "<space>ca",
        "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
        { noremap = true, silent = true, buffer = bufnr, desc = "Code actions" }
      )
      nnoremap("<space>f", function()
        vim.lsp.buf.format({ async = true })
      end, bufopts, "Format file")

      -- Java extensions provided by jdtls
      nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
      nnoremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
      nnoremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
      vim.keymap.set(
        "v",
        "<space>em",
        [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
        { noremap = true, silent = true, buffer = bufnr, desc = "Extract method" }
      )
    end

    local config = {
      flags = {
        debounce_text_changes = 80,
      },
      on_attach = on_attach, -- We pass our on_attach keybindings to the configuration map
      root_dir = root_dir, -- Set the root directory to our found root_marker
      -- Here you can configure eclipse.jdt.ls specific settings
      -- These are defined by the eclipse.jdt.ls project and will be passed to eclipse when starting.
      -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
      -- for a list of options
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
      -- cmd is the command that starts the language server. Whatever is placed
      -- here is what is passed to the command line to execute jdtls.
      -- Note that eclipse.jdt.ls must be started with a Java version of 17 or higher
      -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
      -- for the full list of options
      cmd = {
        -- 💀
        "java", -- or '/path/to/java11_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED", -- 💀
        "-jar",
        vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
        -- Must point to the                                                     Change this to
        -- eclipse.jdt.ls installation                                           the actual version

        -- 💀
        "-configuration",
        home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. CONFIG,
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
        -- Must point to the                      Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation            Depending on your system.

        -- 💀
        -- See `data directory configuration` section in the README
        "-data",
        workspace_dir,
      },
    }

    require("formatter").setup({
      filetype = {
        java = {
          function()
            return {
              exe = "java",
              args = {
                "-jar",
                os.getenv("HOME") .. "/.local/jars/google-java-format-1.15.0-all-deps.jar",
                vim.api.nvim_buf_get_name(0),
              },
              stdin = true,
            }
          end,
        },
      },
    })

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      pattern = { "*.java" },
      callback = function()
        vim.lsp.codelens.refresh()
      end,
    })

    -- Finally, start jdtls. This will run the language server using the configuration we specified,
    -- setup the keymappings, and attach the LSP client to the current buffer
    jdtls.start_or_attach(config)
    jdtls.setup_dap()
  end,
}
