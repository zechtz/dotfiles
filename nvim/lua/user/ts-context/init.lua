local status_ok, context = pcall(require, "treesitter-context")
if not status_ok then
  return
end

context.setup {
  enable = false, -- Enable this plugin (Can be enabled/disabled later via commands)
  throttle = true, -- Throttles plugin updates (may improve performance)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
  },
  context_commentstring = { enable = true, enable_autocmd = false },
}
