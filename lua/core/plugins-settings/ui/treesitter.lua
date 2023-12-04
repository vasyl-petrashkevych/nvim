local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "tsx",
    "typescript",
    "php",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "c",
  },
  ignore_install = {},
  modules = {},
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
