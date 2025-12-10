return {
	"lmantw/themify.nvim",

	lazy = false,
	priority = 999,
	opts = {
		async = false,
		"folke/tokyonight.nvim",
		"Yazeed1s/minimal.nvim",
		"sho-87/kanagawa-paper.nvim",
		"catppuccin/nvim",
		"ellisonleao/gruvbox.nvim",
		"default",
		"habamax",
		"rose-pine/neovim",
		"vague2k/vague.nvim",
		"neanias/everforest-nvim",
		"alexpasmantier/hubbamax.nvim",
	},
	keys = {
		{ mode = "n", "<leader>ft", "<CMD>Themify<CR>", desc = "[F]ind [T]heme" },
	},
}
