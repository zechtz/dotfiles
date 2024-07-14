local M = {}
local api = vim.api
local uv = vim.loop

local is_windows = vim.loop.os_uname().version:match("Windows")

M.sep = is_windows and "\\" or "/"

function M.join(...)
  local result = table.concat(vim.tbl_flatten({ ... }), M.sep):gsub(M.sep .. "+", M.sep)
  return result
end

vim.cmd([[
  function Test()
    %SnipRun
    call feedkeys("\<esc>`.")
  endfunction

  function TestI()
    let b:caret = winsaveview()    
    %SnipRun
    call winrestview(b:caret)
  endfunction
]])

function M.sniprun_enable()
  vim.cmd([[
    %SnipRun

    augroup _sniprun
     autocmd!
     autocmd TextChanged * call Test()
     autocmd TextChangedI * call TestI()
    augroup end
  ]])

  vim.notify("Enabled SnipRun")
end

function M.disable_sniprun()
  M.remove_augroup("_sniprun")
  vim.cmd([[
    SnipClose
    SnipTerminate
    ]])
  vim.notify("Disabled SnipRun")
end

function M.toggle_sniprun()
  if vim.fn.exists("#_sniprun#TextChanged") == 0 then
    M.sniprun_enable()
  else
    M.disable_sniprun()
  end
end

function M.remove_augroup(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end

vim.cmd([[ command! SnipRunToggle execute 'lua require("user.functions").toggle_sniprun()' ]])

-- get length of current word
function M.get_word_length()
  local word = vim.fn.expand("<cword>")
  return #word
end

function M.toggle_option(option)
  local value = not vim.api.nvim_get_option_value(option, {})
  vim.opt[option] = value
  vim.notify(option .. " set to " .. tostring(value))
end

function M.toggle_tabline()
  local value = vim.api.nvim_get_option_value("showtabline", {})

  if value == 2 then
    value = 0
  else
    value = 2
  end

  vim.opt.showtabline = value

  vim.notify("showtabline" .. " set to " .. tostring(value))
end

local diagnostics_active = true
function M.toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

local inlay_hints_enabled = false
function M.toggle_inlay_hints()
  inlay_hints_enabled = not inlay_hints_enabled
  if inlay_hints_enabled then
    vim.lsp.inlay_hint.enable(true)
  else
    vim.lsp.inlay_hint.enable(false)
  end
end

function M.isempty(s)
  return s == nil or s == ""
end

function M.get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

function M.smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd("q!")
      end
    end)
  else
    vim.cmd("q!")
  end
end

function M.find_root_dir(markers, bufname)
  bufname = bufname or api.nvim_get_name(api.nvim_get_current_buf())
  local dirname = vim.fn.fnamemodify(bufname, ":p:h")
  local getparent = function(p)
    return vim.fn.fnamemodify(p, ":h")
  end
  while getparent(dirname) ~= dirname do
    for _, marker in ipairs(markers) do
      if uv.fs_stat(M.join(dirname, marker)) then
        return dirname
      end
    end
    dirname = getparent(dirname)
  end
end

function M.show_documentation()
  -- local saga = require("lspsaga")
  -- saga.hover_doc()
end

return M
