local status, mason = pcall(require, "mason")
if (not status) then return end
local conf_status, mason_conf = pcall(require, "mason-lspconfig")
if (not conf_status) then return end
vim.print("Masson")
mason.setup()
mason_conf.setup {
  ensure_installed = {
    "lua_ls",
    "cmake",
    "clangd",
    "html",
    "clang-format",
    "clangd",
    "cmake-language-server",
    "cmakelang",
    "cmakelint",
    "css-lsp",
    "cssls",
    "lua-language-server",
    "php-cs-fixer",
    "phpcbf",
    "phpcs",
    "prettier",
    "intelephense",
    "tsserver",
    "jsonls",
    "graphql",
  }
}
