return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      init = function()
        -- disable rtp plugin, as we only need its queries for mini.ai
        -- In case other textobject modules are enabled, we will load them
        -- once nvim-treesitter is loaded
        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        local load_textobjects = true
      end,

      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  cmd = { "TSUpdateSync" },
  keys = {
    { "<c-space>", desc = "Increment selection" },
    { "<bs>", desc = "Decrement selection", mode = "x" },
  },

  opts = function(_, opts)
    local function have(command)
      local output = vim.fn.system("command -v " .. command)
      return vim.fn.empty(output) == 0
    end

    --This update ensures that the treesitter ensure_installed table
    --exists and then extends it by adding the markdown parser.
    --It then registers the mdx language to use the markdown parser.
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "markdown" })
      vim.treesitter.language.register("markdown", "mdx")
    end

    local function add(lang)
      if type(opts.ensure_installed) == "table" then
        table.insert(opts.ensure_installed, lang)
      end
    end

    local function filetype_add(mapping)
      vim.filetype.add(mapping)
    end

    filetype_add({
      extension = { rasi = "rasi" },
      pattern = {
        [".*/waybar/config"] = "jsonc",
        [".*/mako/config"] = "dosini",
        [".*/kitty/*.conf"] = "bash",
      },
    })

    add("git_config")

    if have("fish") then
      add("fish")
    end

    if have("rofi") or have("wofi") then
      add("rasi")
    end
  end,
}
