vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("core.settings")
require("core.plugins")
require("core.plugins-settings")
require("core.keymaps")

local os = vim.loop.os_uname().sysname

if os == "Linux" then
  require("core.linux")
elseif os == "Windows_NT" then
  require("core.windows")
end
