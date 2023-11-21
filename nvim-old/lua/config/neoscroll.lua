local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  return
end

local t = {}
t["<c-k>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
t["<c-j>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }

require("neoscroll.config").set_mappings(t)
