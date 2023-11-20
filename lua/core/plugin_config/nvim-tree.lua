vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
local status, nvim_tree = pcall(require, "nvim-tree")
if (not status) then return end

-- OR setup with some options
nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set('n', '<Space>n', ':NvimTreeFindFileToggle<CR>')
