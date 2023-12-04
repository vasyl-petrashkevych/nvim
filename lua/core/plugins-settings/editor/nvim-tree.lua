local status, neoTree = pcall(require, "neo-tree")
if (not status) then
  print("Neo tree is not installed")
end


neoTree.setup({
  filesystem = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true
    }
  }
})
