 local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
-- Set glsl highlighting for shaders
-- autocmd("BufRead, BufNewFile", {
--   pattern = "*.frag,*.vert,*.fp,*.vp,*.glsl",
--   command = "setf glsl",
-- })
-- autocmd("BufRead, BufNewFile", {
--   pattern = "hyprland.conf",
--   command = "setf hyprland",
-- })
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
