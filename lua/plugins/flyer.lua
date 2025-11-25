return {
	"A7Lavinraj/fyler.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	branch = "stable",
	lazy = false,
	opts = {
		views = {
			finder = {
				close_on_select = "true",
			},
			indentscope = {
				enabled = "true",
			},
		},
	},
	keys = {
		{ mode = "n", "<leader>e", "<CMD>Fyler<CR>", desc = "Open current directory" },
	},
}
