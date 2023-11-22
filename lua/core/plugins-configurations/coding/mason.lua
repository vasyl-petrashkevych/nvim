local status, mason = pcall(require, "mason")
if (not status) then return end
local conf_status, mason_conf = pcall(require, "mason-lspconfig")
if (not conf_status) then return end
mason.setup()
mason_conf.setup {
  ensure_installed = {
    "lua_ls",
    "cmake",
    "clangd",
    "html",
    "cssls",
    "intelephense",
    "tsserver",
    "jsonls",
    "graphql",
  },
  automatic_installation = true
}
