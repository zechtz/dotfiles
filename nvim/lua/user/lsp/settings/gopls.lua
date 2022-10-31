return {
  cmd = { "gopls", "serve" },
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      linksInHover = false,
      codelenses = {
        generate = true,
        gc_details = true,
        regenerate_cgo = true,
        tidy = true,
        upgrade_depdendency = true,
        vendor = true,
      },
      usePlaceholders = true,
    },
  },
}
