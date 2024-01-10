return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
		opts = {
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
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				icons_enabled = true,
				theme = 'gruvbox',
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' },
				disabled_filetypes = {}
			},
			extensions = { 'fugitive' }
		}
	},
	{
		'nvimdev/lspsaga.nvim',
		keys = {
			{ '<C-j>',      '<Cmd>Lspsaga diagnostic_jump_next<CR>',  desc = "Lspsaga diagnostic_jump_next",   mode = 'n' },
			{ '<C-k>',      '<Cmd>Lspsaga diagnostic_jump_prev<CR>',  desc = "Lspsaga diagnostic_jump_prev",   mode = 'n' },
			{ '<leadr>l',   '<Cmd>Lspsaga show_line_diagnostics<CR>', desc = "Lspsaga show_line_diagnostics ", mode = 'n' },
			{ 'K',          '<Cmd>Lspsaga hover_doc<CR>',             desc = "Lspsaga hover doc",              mode = 'n' },
			{ '<leader>fd', '<Cmd>Lspsaga finder<CR>',                desc = "Lspsaga finder",                 mode = 'n' },
			{ '<leader>rn', '<Cmd>Lspsaga rename<CR>',                desc = "Lspsaga rename",                 mode = 'n' },
			{ '<leader>p',  '<Cmd>Lspsaga peek_defenition<CR>',       desc = "Lspsaga peek defenition",        mode = 'n' },
		},
		config = function()
			require('lspsaga').setup({
			})
		end,
		dependencies = {
			'nvim-treesitter/nvim-treesitter', -- optional
			'nvim-tree/nvim-web-devicons',  -- optional
		},
	}
}
