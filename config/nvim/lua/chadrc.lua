local M = {}

-- Path to overriding theme and highlights files
local highlights = require("highlights")

M.base46 = {
  theme = "chocolate",
  theme_toggle = { "radium", "chocolate" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "default",
  },
}

M.term = {
  sizes = { sp = 0.3, vsp = 0.4 },
  float = {
    col = 0.15,
    width = 0.7,
  },
}

M.plugins = {
  ["hrsh7th/nvim-cmp"] = {
    override_options = function()
      return require("configs.cmp")
    end,
  },
}

return M
