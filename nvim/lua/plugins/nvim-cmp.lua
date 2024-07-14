return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind-nvim", -- Add lspkind-nvim
    "L3MON4D3/LuaSnip",
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load() -- Load snippets from friendly-snippets
      end,
    },
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      build = ":Copilot auth",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          panel = {
            enabled = true,
            auto_refresh = true,
            keymap = {
              jump_next = "<c-j>",
              jump_prev = "<c-k>",
              accept = "<c-a>",
              refresh = "r",
              open = "<M-CR>",
            },
            layout = {
              position = "bottom", -- | top | left | right
              ratio = 0.4,
            },
          },
          suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
              accept = "<c-a>",
              accept_word = false,
              accept_line = false,
              next = "<c-j>",
              prev = "<c-k>",
              dismiss = "<C-e>",
            },
          },
        })
      end,
    },
    {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function()
        require("copilot_cmp").setup()
      end,
    },
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local defaults = require("cmp.config.default")()
    return {
      auto_brackets = {}, -- configure any filetype to auto add brackets
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<TAB>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = LazyVim.cmp.confirm(),
        ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end,
        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users
        { name = "path" },
        { name = "copilot" }, -- Add Copilot as a source
      }, {
        { name = "buffer" },
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          menu = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            path = "[Path]",
            copilot = "[Copilot]",
          },
        }),
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
        }),
      },

      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
  ---@param opts cmp.ConfigSchema | {auto_brackets?: string[]}
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end

    local parse = require("cmp.utils.snippet").parse
    parse = function(input)
      local ok, ret = pcall(parse, input)
      if ok then
        return ret
      end
      return LazyVim.cmp.snippet_preview(input)
    end

    local cmp = require("cmp")
    cmp.setup(opts)
    cmp.event:on("confirm_done", function(event)
      if vim.tbl_contains(opts.auto_brackets or {}, vim.bo.filetype) then
        LazyVim.cmp.auto_brackets(event.entry)
      end
    end)
    cmp.event:on("menu_opened", function(event)
      LazyVim.cmp.add_missing_snippet_docs(event.window)
    end)
  end,
}
