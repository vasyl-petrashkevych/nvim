require("core.settings")
require("core.general-keymaps")
require("core.plugins")
require("core.plugins-configurations")

local os = vim.loop.os_uname().sysname

if os == "Linux" then
  require("core.linux")
elseif os == "Windows_NT" then
  require("core.windows")
end
