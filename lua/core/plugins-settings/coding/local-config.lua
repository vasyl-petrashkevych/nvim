local status, local_config = pcall(require, "config-local")
if (not status) then return end
local_config.setup({
  config_files = { ".nvim.lua", ".nvimrc", ".exrc" },

  -- Where the plugin keeps files data
  hashfile = vim.fn.stdpath("data") .. "/config-local",

  autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
  commands_create = true,     -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalIgnore)
  silent = false,             -- Disable plugin messages (Config loaded/ignored)
  lookup_parents = false,     -- Lookup config files in parent directories
})
