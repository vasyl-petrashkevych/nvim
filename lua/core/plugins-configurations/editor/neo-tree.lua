local status, neoTree = pcall(require, "neo-tree")
if (not status) then
  print("Neo tree is not installed")
end
neoTree.setup()

vim.keymap.set('n', '<Space>e', ':Neotree toggle<CR>')
