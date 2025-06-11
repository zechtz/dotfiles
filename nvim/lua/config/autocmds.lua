-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Helper function to detect Laravel project
local function is_laravel_project()
  local composer_json = vim.fn.findfile("composer.json", vim.fn.getcwd() .. ";")
  if composer_json == "" then
    return false
  end
  local content = vim.fn.readfile(composer_json)
  for _, line in ipairs(content) do
    if line:match('"laravel/framework"') then
      return true
    end
  end
  return false
end

-- Install laravel-ide-helper and spatie/laravel-stubs if not already installed
local function install_laravel_ide_helper()
  if not is_laravel_project() then
    return
  end
  local composer_json = vim.fn.findfile("composer.json", vim.fn.getcwd() .. ";")
  local content = vim.fn.readfile(composer_json)
  local ide_helper_installed = false
  local spatie_stubs_installed = false
  for _, line in ipairs(content) do
    if line:match('"barryvdh/laravel%-ide%-helper"') then
      ide_helper_installed = true
    end
    if line:match('"spatie/laravel%-stubs"') then
      spatie_stubs_installed = true
    end
  end
  if not ide_helper_installed then
    vim.notify("Installing barryvdh/laravel-ide-helper...", vim.log.levels.INFO)
    vim.fn.jobstart({ "composer", "require", "--dev", "barryvdh/laravel-ide-helper" }, {
      on_exit = function(_, code)
        if code == 0 then
          vim.notify("laravel-ide-helper installed successfully!", vim.log.levels.INFO)
        else
          vim.notify("Failed to install laravel-ide-helper", vim.log.levels.ERROR)
        end
      end,
    })
  end
  if not spatie_stubs_installed then
    vim.notify("Installing spatie/laravel-stubs...", vim.log.levels.INFO)
    vim.fn.jobstart({ "composer", "require", "--dev", "spatie/laravel-stubs" }, {
      on_exit = function(_, code)
        if code == 0 then
          vim.notify("spatie/laravel-stubs installed successfully!", vim.log.levels.INFO)
        else
          vim.notify("Failed to install spatie/laravel-stubs", vim.log.levels.ERROR)
        end
      end,
    })
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    install_laravel_ide_helper()
  end,
  desc = "Install laravel-ide-helper and spatie/laravel-stubs when opening a Laravel project",
})

-- Generate all IDE helper files
local function generate_ide_helper_files()
  if not is_laravel_project() then
    return
  end
  local artisan = vim.fn.findfile("artisan", vim.fn.getcwd() .. ";")
  if artisan == "" then
    vim.notify("Could not find artisan executable", vim.log.levels.ERROR)
    return
  end

  -- Generate _ide_helper.php with write option to include facades like Request
  vim.fn.jobstart({ "php", artisan, "ide-helper:generate", "--write" }, {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("Generated _ide_helper.php", vim.log.levels.INFO)
      else
        vim.notify("Failed to generate _ide_helper.php", vim.log.levels.ERROR)
      end
    end,
  })

  -- Generate .phpstorm.meta.php
  vim.fn.jobstart({ "php", artisan, "ide-helper:meta" }, {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("Generated .phpstorm.meta.php", vim.log.levels.INFO)
      else
        vim.notify("Failed to generate .phpstorm.meta.php", vim.log.levels.ERROR)
      end
    end,
  })
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    generate_ide_helper_files()
  end,
  desc = "Generate Laravel IDE helper files when opening a Laravel project",
})

-- Configure phpactor
local function configure_phpactor()
  if not is_laravel_project() then
    return
  end

  local phpactor_config_file = vim.fn.getcwd() .. "/.phpactor.json"
  local phpactor_config = {
    indexer = {
      paths = {
        "_ide_helper.php",
        ".phpstorm.meta.php",
      },
    },
    language_server_php_stubs = {
      stub_dirs = {
        "vendor/spatie/laravel-stubs/stubs",
      },
    },
    language_server = {
      diagnostic_logging = true,
      diagnostic_logging_path = "/tmp/phpactor.log",
    },
  }

  -- Write the config file if it doesn't exist
  if vim.fn.filereadable(phpactor_config_file) == 0 then
    vim.fn.writefile({ vim.fn.json_encode(phpactor_config) }, phpactor_config_file)
    vim.notify("Created .phpactor.json for Laravel project", vim.log.levels.INFO)
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    configure_phpactor()
  end,
  desc = "Configure phpactor for Laravel project",
})

-- Automate ide-helper:models on model file changes
local last_run = 0
local debounce_ms = 5000 -- 5 seconds debounce

local function run_ide_helper_models()
  local now = vim.loop.now()
  if now - last_run < debounce_ms then
    return
  end
  last_run = now

  if not is_laravel_project() then
    return
  end

  local artisan = vim.fn.findfile("artisan", vim.fn.getcwd() .. ";")
  if artisan == "" then
    vim.notify("Could not find artisan executable", vim.log.levels.ERROR)
    return
  end

  vim.fn.jobstart({ "php", artisan, "ide-helper:models", "--write", "--reset" }, {
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("Updated model docblocks", vim.log.levels.INFO)
        -- Reload the buffer to reflect changes
        vim.cmd("edit")
        -- Reindex phpactor and restart LSP after a short delay
        vim.defer_fn(function()
          vim.cmd("PhpactorReindex")
          vim.cmd("LspRestart")
        end, 1000)
      else
        vim.notify("Failed to update model docblocks", vim.log.levels.ERROR)
      end
    end,
  })
end

-- Run ide-helper:models when a model file is saved
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = "*/app/Models/*.php", -- Adjust path to match your model directory
  callback = function()
    run_ide_helper_models()
  end,
  desc = "Run ide-helper:models when a model file is saved",
})

-- Run ide-helper:models on startup for initial setup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if is_laravel_project() then
      run_ide_helper_models()
    end
  end,
  desc = "Run ide-helper:models on startup in a Laravel project",
})
