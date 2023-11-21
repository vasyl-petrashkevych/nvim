local status, illuminate = pcall(require, "illuminate")
if (not status) then return end

illuminate.configure()

vim.api.nvim_command [[ hi def IlluminatedWordText  cterm=bold gui=underline]]
vim.api.nvim_command [[ hi def IlluminatedWordRead  cterm=bold gui=underline]]
vim.api.nvim_command [[ hi def IlluminatedWordWrite cterm=bold gui=underline]]

-- change the highlight style
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

--- auto update the highlight style on colorscheme change
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = { "*" },
  callback = function(ev)
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
  end
})
