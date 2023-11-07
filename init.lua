require("core.keymaps")
require("core.plugins")
require("core.settings")
require("core.plugin_config")

-- Autocommands
vim.cmd([[
augroup AutoCmds
    autocmd!
    autocmd BufWritePost * silent! lua require'format'.format()
augroup END
]])
