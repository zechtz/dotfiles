local check_backspace = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local buffer_fts = { "markdown", "toml", "yaml", "json" }

local function contains(t, value)
  for _, v in pairs(t) do
    if v == value then
      return true
    end
  end
  return false
end

local compare = require("cmp.config.compare")

local icons = require("user.icons")

local kind_icons = icons.kind

require("luasnip/loaders/from_vscode").lazy_load()

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })
vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    {
      "zbirenbaum/copilot-cmp",
      opts = {
        suggestions = { enabled = true },
        panel = { enabled = true },
      },
    },
    -- Add other sources you want to use here
  },

  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local defaults = require("cmp.config.default")()
    local tabnine = require("cmp_tabnine.config")

    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<m-o>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-c>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
        ["<m-j>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
        ["<m-k>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
        ["<m-c>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
        ["<S-CR>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Right>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif check_backspace() then
            -- cmp.complete()
            fallback()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "crates", group_index = 1 },
        {
          name = "nvim_lsp",
          filter = function(entry, ctx)
            local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
            if kind == "Snippet" and ctx.prev_context.filetype == "java" then
              return true
            end

            if kind == "Text" then
              return true
            end
          end,
          group_index = 2,
        },
        { name = "nvim_lua", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        {
          name = "buffer",
          group_index = 2,
          filter = function(entry, ctx)
            if not contains(buffer_fts, ctx.prev_context.filetype) then
              return true
            end
          end,
        },
        { name = "cmp_tabnine", group_index = 2 },
        { name = "path", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "emoji", group_index = 2 },
        { name = "lab.quick_data", keyword_length = 4, group_index = 2 },
      }),

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = kind_icons[vim_item.kind]

          if entry.source.name == "cmp_tabnine" then
            vim_item.kind = icons.misc.Robot
            vim_item.kind_hl_group = "CmpItemKindTabnine"
          end
          if entry.source.name == "copilot" then
            vim_item.kind = icons.git.Octoface
            vim_item.kind_hl_group = "CmpItemKindCopilot"
          end

          if entry.source.name == "emoji" then
            vim_item.kind = icons.misc.Smiley
            vim_item.kind_hl_group = "CmpItemKindEmoji"
          end

          if entry.source.name == "crates" then
            vim_item.kind = icons.misc.Package
            vim_item.kind_hl_group = "CmpItemKindCrate"
          end

          if entry.source.name == "lab.quick_data" then
            vim_item.kind = icons.misc.CircuitBoard
            vim_item.kind_hl_group = "CmpItemKindConstant"
          end

          -- NOTE: order matters
          vim_item.menu = ({
            nvim_lsp = "",
            nvim_lua = "",
            luasnip = "",
            buffer = "",
            path = "",
            cmp_tabnine = "",
            copilot = "",
            emoji = "",
          })[entry.source.name]
          return vim_item
        end,
      },

      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          -- require("copilot_cmp.comparators").prioritize,
          -- require("copilot_cmp.comparators").score,
          compare.offset,
          compare.exact, -- compare.scopes,
          compare.score,
          compare.recently_used,
          compare.locality, -- compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
          -- require("copilot_cmp.comparators").prioritize,
          -- require("copilot_cmp.comparators").score,
        },
      },

      confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = false },
      window = {
        documentation = false,
        -- documentation = {
        -- border = "rounded",
        -- winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
        -- },
        completion = {
          border = "rounded",
          winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
        },
      },
    },
      tabnine:setup({
        -- Your TabNine configuration options here...
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = "..",
        ignored_file_types = {
          -- default is not to ignore
          -- uncomment to ignore in lua:
          -- lua = true
        },
        show_prediction_strength = false,
      })
  end,
}
