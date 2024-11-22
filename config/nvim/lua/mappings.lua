require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
    require("conform").format()
end, { desc = "File Format with conform" })

-- Custom
map({ "n" }, "<C-Left>", "<C-w>h", { desc = "window left" })
map({ "n" }, "<C-Right>", "<C-w>l", { desc = "window right" })
map({ "n" }, "<C-Up>", "<C-w>k", { desc = "window up" })
map({ "n" }, "<C-Down>", "<C-w>j", { desc = "window down" })

map({ "n" }, "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "toggle nvimtree" })

map({ "n" }, "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add Breakpoint at line" })
map({ "n" }, "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue debugger" })
