return {
  {
    { "folke/tokyonight.nvim", opts = { style = "moon" } },
    { "shaunsingh/solarized.nvim" },
    { "rose-pine/neovim" },
    { "rebelot/kanagawa.nvim" },
    { "whatyouhide/vim-gotham" },
    { "lunarvim/colorschemes" },
    { "sam4llis/nvim-tundra" },
    { "Mofiqul/vscode.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    { "lunarvim/onedarker.nvim" },
    -- { "lunarvim/darkplus.nvim" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "ViViDboarder/wombat.nvim",
    dependencies = { { "rktjmp/lush.nvim" } },
    opts = {
      -- You can optionally specify the name of the ansi colors you wish to use
      -- This defaults to nil and will use the default ansi colors for the theme
      ansi_colors_name = nil,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catpuccin",
    },
  },
}
