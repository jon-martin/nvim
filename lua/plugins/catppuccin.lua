require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = false,
  dim_inactive = {
    enabled = true,
    shade = "light",
    percentage = 0.5,
  },
  highlight_overrides = {
    mocha = function (C)
      return { ["@string"] = { fg = C.teal },
      }
    end
    }
})
