local status, theme = pcall(require, "onedark")
if (not status) then return end
-- theme.setup()
-- vim.cmd("colorscheme gruvbox")
theme.setup {
  style = 'darker'
}
theme.load()
