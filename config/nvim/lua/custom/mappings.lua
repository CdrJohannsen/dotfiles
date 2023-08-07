---@type MappingsTable
local M = {}

M.general = {
    n = {
        [";"] = { ":", "enter command mode", opts = { nowait = true } },
        ["<C-Left>"] = { "<C-w>h", "window left" },
        ["<C-Right>"] = { "<C-w>l", "window right" },
        ["<C-Down>"] = { "<C-w>j", "window down" },
        ["<C-Up>"] = { "<C-w>k", "window up" },
        ["<F5>"] = { "<cmd> make <CR>", "make" },
    },
}

M.nvimtree = {
    n = {
        ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree", opts = { nowait = true} },
    }
}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add Breakpoint at line"},
        ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue debugger"}
    }
}

-- more keybinds!

return M
