local status, theme = pcall(require, "gruvbox")
if (not status) then return end
theme.setup()
vim.cmd("colorscheme gruvbox")
