return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mfussenegger/nvim-jdtls" },
    opts = function()
      local mason_registry = require("mason-registry")
      local jdtls_pkg = mason_registry.get_package("jdtls")
      local jdtls_path = jdtls_pkg:get_install_path()
      local lombok_jar = jdtls_path .. "/lombok.jar"
      local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
      local config_dir = jdtls_path .. "/config_linux" -- Adjust for OS if needed

      return {
        setup = {
          jdtls = function(_, opts)
            vim.api.nvim_create_autocmd("FileType", {
              pattern = "java",
              callback = function()
                require("lazyvim.util").lsp.on_attach(function(_, buffer)
                  vim.keymap.set(
                    "n",
                    "<leader>di",
                    "<Cmd>lua require'jdtls'.organize_imports()<CR>",
                    { buffer = buffer, desc = "Organize Imports" }
                  )
                  vim.keymap.set(
                    "n",
                    "<leader>dt",
                    "<Cmd>lua require'jdtls'.test_class()<CR>",
                    { buffer = buffer, desc = "Test Class" }
                  )
                  vim.keymap.set(
                    "n",
                    "<leader>dn",
                    "<Cmd>lua require'jdtls'.test_nearest_method()<CR>",
                    { buffer = buffer, desc = "Test Nearest Method" }
                  )
                  vim.keymap.set(
                    "v",
                    "<leader>de",
                    "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
                    { buffer = buffer, desc = "Extract Variable" }
                  )
                  vim.keymap.set(
                    "n",
                    "<leader>de",
                    "<Cmd>lua require('jdtls').extract_variable()<CR>",
                    { buffer = buffer, desc = "Extract Variable" }
                  )
                  vim.keymap.set(
                    "v",
                    "<leader>dm",
                    "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
                    { buffer = buffer, desc = "Extract Method" }
                  )
                  vim.keymap.set(
                    "n",
                    "<leader>cf",
                    "<cmd>lua vim.lsp.buf.formatting()<CR>",
                    { buffer = buffer, desc = "Format" }
                  )
                end)

                local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
                local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name
                local config = {
                  cmd = {
                    "java",
                    "-javaagent:" .. lombok_jar,
                    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "-Dosgi.bundles.defaultStartLevel=4",
                    "-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "-Dlog.protocol=true",
                    "-Dlog.level=ALL",
                    "-Xms1g",
                    "--add-modules=ALL-SYSTEM",
                    "--add-opens",
                    "java.base/java.util=ALL-UNNAMED",
                    "--add-opens",
                    "java.base/java.lang=ALL-UNNAMED",
                    "-jar",
                    launcher_jar,
                    "-configuration",
                    config_dir,
                    "-data",
                    workspace_dir,
                  },
                  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "gradle" }),
                  settings = {
                    java = {},
                  },
                  handlers = {
                    ["language/status"] = function(_, result)
                      -- print(result)
                    end,
                    ["$/progress"] = function(_, result, ctx)
                      -- disable progress updates
                    end,
                  },
                }
                require("jdtls").start_or_attach(config)
              end,
            })
            return true
          end,
        },
      }
    end,
  },
}
