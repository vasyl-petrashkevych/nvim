return {
	"nvimtools/none-ls.nvim",
	dependencies = { "mason.nvim" },
	opts = function(_, opts)
		local nls = require("null-ls")
		opts.root_dir = opts.root_dir
				or require("null-ls.utils").root_pattern(
					".null-ls-root",
					".neoconf.json",
					"Makefile",
					".git",
					"composer.json",
					-- "package.json",
					"Makefile"
				)
		opts.diagnostics_format = "#{m} (#{c}) [#{s}]"
		opts.sources = vim.list_extend(opts.sources or {}, {
			nls.builtins.formatting.fish_indent,
			nls.builtins.diagnostics.fish,
			nls.builtins.formatting.stylua,
			nls.builtins.formatting.shfmt,
			nls.builtins.diagnostics.phpcs.with({ -- Change how the php linting will work
				prefer_local = "vendor/bin",
			}),
			nls.builtins.formatting.phpcbf.with({ -- Use the local installation first
				prefer_local = "vendor/bin",
			}),
		})
	end,
}
