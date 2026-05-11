return {
	"folke/todo-comments.nvim",
	event = "BufRead",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
	},
	keys = {
		{ "<leader>fo", "<cmd>TodoFzfLua<CR>", desc = "[F]ind t[O]do" },
	},
}
