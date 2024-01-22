return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"echasnovski/mini.pairs",
		version = "",
	},
	{
		'echasnovski/mini.comment',
		version = false,
		config = function()
			require("mini.comment").setup({
				options = {
					custom_commentstring = nil,
					ignore_blank_line = false,
					start_of_line = false,
					pad_comment_parts = true,
				},
				mappings = {
					comment = 'gc',
					comment_line = 'gcc',
					comment_visual = 'gc',
					textobject = 'gc',
				},
				hooks = {
					pre = function() end,
					post = function() end,
				},
			})
		end,
	},
	{
		'echasnovski/mini.surround',
		version = false,
		config = function()
			require("mini.surround").setup({
				{
					mappings = {
						add = 'sa',      -- Add surrounding in Normal and Visual modes
						delete = 'sd',   -- Delete surrounding
						find = 'sf',     -- Find surrounding (to the right)
						find_left = 'sF', -- Find surrounding (to the left)
						highlight = 'sh', -- Highlight surrounding
						replace = 'sr',  -- Replace surrounding
						update_n_lines = 'sn', -- Update `n_lines`

						suffix_last = 'l', -- Suffix to search with "prev" method
						suffix_next = 'n', -- Suffix to search with "next" method
					},
				}
			})
		end
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end
	}
}
