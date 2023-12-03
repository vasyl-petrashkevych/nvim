local status, lua_line = pcall(require, "lualine")
if (not status) then return end
lua_line.setup()
