local status, lua_line = pcall(require, "lualine")
if (not status) then return end
lua_line.setup({
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {}
  },
  extensions = { 'fugitive' }
})
