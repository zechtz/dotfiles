return {
  "ThePrimeagen/harpoon",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("harpoon").setup({})
  end,
}
