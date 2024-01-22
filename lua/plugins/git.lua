return {
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim"
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},
	'lewis6991/gitsigns.nvim',
	-- 'tpope/vim-fugitive',
	'dinhhuy258/git.nvim', -- For git
}
