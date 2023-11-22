local status, neoTree = pcall(require, "neo-tree")
if (not status) then
  print("Neo tree is not installed")
end
neoTree.setup()
