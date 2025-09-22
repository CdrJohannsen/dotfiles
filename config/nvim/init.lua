vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
        config = function()
            require("options")
        end,
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("nvchad.autocmds")

vim.schedule(function()
    require("mappings")
end)

-- Auto resize panes when resizing nvim window
local autocmd = vim.api.nvim_create_autocmd
autocmd("VimResized", {
    pattern = "*",
    command = "tabdo wincmd =",
})

local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.syntax = "enable"

opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldmethod = "expr"
opt.foldlevel = 999
opt.foldtext = "getline(v:foldstart)"
opt.fillchars = "foldclose:,foldopen:,foldsep: ,fold: "
opt.foldcolumn = "auto:1"
-- opt.statuscolumn =
-- '%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "" : "") : " " }%=%l%s'

vim.filetype.add({
    pattern = {
        [".*/hypr.*%.conf"] = "hyprlang",
        ["*.frag,*.vert,*.fp,*.vp,*.glsl"] = "glsl",
        ["~/.config/waybar/config"] = "json",
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "hyprlang",
    callback = function(event)
        vim.bo[event.buf].commentstring = "# %s"
    end,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
    },
})
