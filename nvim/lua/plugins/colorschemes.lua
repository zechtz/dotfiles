return {
  { "lunarvim/onedarker.nvim" },
  {
    "lunarvim/darkplus.nvim",
    lazy = false, -- make sure we load this during startup because its our main colorscheme
    priority = 1000, -- make sure we run this before other startup plugins
    config = function() end,
  },
  { "folke/tokyonight.nvim" },
  { "shaunsingh/solarized.nvim" },
  { "rose-pine/neovim" },
  { "rebelot/kanagawa.nvim" },
  { "whatyouhide/vim-gotham" },
  { "lunarvim/colorschemes" },
  { "sam4llis/nvim-tundra" },
  { "Mofiqul/vscode.nvim" },
}
