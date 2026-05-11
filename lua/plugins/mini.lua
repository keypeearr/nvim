return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.surround").setup()
		local mini_comment = require("mini.comment")
		mini_comment.setup({
			hooks = {
				pre = function()
					vim.b.minicomment_original_commentstring = vim.bo.commentstring
				end,
				post = function()
					if vim.b.minicomment_original_commentstring then
						vim.bo.commentstring = vim.b.minicomment_original_commentstring
						vim.b.minicomment_original_commentstring = nil
					end
				end,
			},
		})
	end,
}
