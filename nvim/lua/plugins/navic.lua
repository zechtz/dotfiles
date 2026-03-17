return {
  {
    "SmiteshP/nvim-navic",
    opts = {
      highlight = true,
      depth_limit = 5,
      depth_limit_indicator = "..",
      separator = " > ",
      safe_output = true,
      click = true,
      lsp = {
        auto_attach = true,
      },
    },
  },
}
