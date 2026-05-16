local flash = require("flash")

flash.setup({
  modes = {
    char = {
      char_actions = function() return { [";"] = "next", [","] = "prev" } end,
    },
  },
})
