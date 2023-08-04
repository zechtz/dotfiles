local icons = require("user.icons")

local error_red = "#F44747"
local warning_orange = "#ff8800"
-- local info_yellow = "#FFCC66"
local hint_blue = "#4FC1FF"
local perf_purple = "#7C3AED"
local note_green = "#10B981"

return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile" },
  config = true,
  -- stylua: ignore
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },

  keywords = {
    FIX = {
      icon = icons.ui.Bug, -- icon used for the sign, and in search results
      color = error_red, -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
    },
    TODO = { icon = icons.ui.Check, color = hint_blue, alt = { "TIP" } },
    HACK = { icon = icons.ui.Fire, color = warning_orange },
    WARN = { icon = icons.diagnostics.Warning, color = warning_orange, alt = { "WARNING", "XXX" } },
    PERF = { icon = icons.ui.Dashboard, color = perf_purple, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "TEST" } },
    NOTE = { icon = icons.ui.Note, color = note_green, alt = { "INFO" } },
  },
  -- merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    before = "", -- "fg" or "bg" or empty
    -- keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = { "markdown" }, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of hilight groups or use the hex color if hl not found as a fallback
  -- colors = {
  --   error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
  --   warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
  --   info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
  --   hint = { "LspDiagnosticsDefaultHint", "#10B981" },
  --   default = { "Identifier", "#7C3AED" },
  -- },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}
