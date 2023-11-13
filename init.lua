require("core.keymaps")
require("core.plugins")
require("core.settings")
require("core.plugin_config")

local os = vim.loop.os_uname().sysname

if os == "Linux" then
  require("core.linux")
elseif os == "Windows_NT" then
  require("core.windows")
end

