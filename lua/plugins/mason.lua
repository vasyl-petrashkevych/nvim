return {
	'williamboman/mason.nvim',
	config = function()
		local mason = require("mason")
		local mason_conf = require("mason-lspconfig")
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
				"docker_compose_language_service",
				"dockerls",
				"bashls"
			},
			automatic_installation = true
		}
	end
}
