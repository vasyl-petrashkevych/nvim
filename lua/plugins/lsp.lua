return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		-- Additional lua configuration, makes nvim stuff amazing!
		"folke/neodev.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")

		local keymap = vim.keymap

		local opts = { noremap = true, silent = true }

		local protocol = require("vim.lsp.protocol")

		protocol.CompletionItemKind = {
			"", -- Text
			"", -- Method
			"", -- Function
			"", -- Constructor
			"", -- Field
			"", -- Variable
			"", -- Class
			"ﰮ", -- Interface
			"", -- Module
			"", -- Property
			"", -- Unit
			"", -- Value
			"", -- Enum
			"", -- Keyword
			"﬌", -- Snippet
			"", -- Color
			"", -- File
			"", -- Reference
			"", -- Folder
			"", -- EnumMember
			"", -- Constant
			"", -- Struct
			"", -- Event
			"ﬦ", -- Operator
			"", -- TypeParameter
		}

		local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

		local enable_format_on_save = function(_, bufnr)
			vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup_format,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"

			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			-- opts.desc = "Smart rename"
			-- keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessar
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			},
		})
		lspconfig.docker_compose_language_service.setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
			apabilities = capabilities,
		})
		lspconfig.dockerls.setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
			apabilities = capabilities,
		})

		lspconfig.clangd.setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
			apabilities = capabilities,
		})

		lspconfig.cmake.setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
			apabilities = capabilities,
		})
		lspconfig.bashls.setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
			apabilities = capabilities,
		})

		-- Wordpress
		-- --Enable (broadcasting) snippet capability for completion
		local css_capabilities = vim.lsp.protocol.make_client_capabilities()
		css_capabilities.textDocument.completion.completionItem.snippetSupport = true
		lspconfig.cssls.setup({
			capabilities = css_capabilities,
		})
		lspconfig.html.setup({
			capabilities = css_capabilities,
		})

		lspconfig.stylelint_lsp.setup({
			filetypes = { "css", "scss", "less" },
			settings = {
				stylelintplus = {
					autoFixOnSave = true,
					autoFixOnFormat = true,
				},
			},
		})

		lspconfig.eslint.setup({
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})

		lspconfig.tsserver.setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
			end,
			filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
			cmd = { "typescript-language-server", "--stdio" },
			capabilities = capabilities,
		})
		lspconfig.jsonls.setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
			capabilities = capabilities,
			cmd = { "vscode-json-language-server", "--stdio" },
		})
		lspconfig.intelephense.setup({
			cmd = { "intelephense", "--stdio" },
			root_pattern = { "composer.json", ".git" },
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				enable_format_on_save(client, bufnr)
			end,
			capabilities = capabilities,
			filetypes = { "php" },
			settings = {
				intelephense = {
					diagnostics = {
						enable = true,
					},
					stubs = {
						"bcmath",
						"bz2",
						"Core",
						"curl",
						"date",
						"dom",
						"fileinfo",
						"filter",
						"gd",
						"gettext",
						"hash",
						"iconv",
						"imap",
						"intl",
						"json",
						"libxml",
						"mbstring",
						"mcrypt",
						"mysql",
						"mysqli",
						"password",
						"pcntl",
						"pcre",
						"PDO",
						"pdo_mysql",
						"Phar",
						"readline",
						"regex",
						"session",
						"SimpleXML",
						"sockets",
						"sodium",
						"standard",
						"superglobals",
						"tokenizer",
						"xml",
						"xdebug",
						"xmlreader",
						"xmlwriter",
						"yaml",
						"zip",
						"zlib",
						"wordpress-stubs",
						"woocommerce-stubs",
						"acf-pro-stubs",
						"wordpress-globals",
						"wp-cli-stubs",
						"genesis-stubs",
						"polylang-stubs",
					},
					environment = {
						includePaths = {
							"/home/wisehunter/.config/composer/vendor/php-stubs",
							"/home/wisehunter/.config/composer/vendor/wpsyntex",
						},
					},
					json = {
						schemas = {
							{
								description = "NPM configuration file",
								fileMatch = {
									"package.json",
								},
								url = "https://json.schemastore.org/package.json",
							},
						},
					},
					files = {
						maxSize = 5000000,
					},
				},
			},
		})
	end,
}
