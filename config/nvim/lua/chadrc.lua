local M = {}

-- Path to overriding theme and highlights files
local highlights = require("highlights")

M.base46 = {
    theme = "chocolate",
    theme_toggle = { "radium", "chocolate" },

    hl_override = highlights.override,
    hl_add = highlights.add,
    transparency = true,
    statusline = {
        theme = "default",
        separator_style = "default",
    },
    term = {
        sizes = { sp = 0.5, vsp = 0.5 },
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
