vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,

	underline = { severity = vim.diagnostic.severity.ERROR },

	float = {
		border = "rounded",
		source = "if_many",
	},

	virtual_lines = false,

	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},

	virtual_text = {
		source = "if_many",
		spacing = 2,

		format = function(diagnostic)
			return diagnostic.message
		end,
	},

	jump = {
		on_jump = function(_, bufnr)
			vim.diagnostic.open_float({
				bufnr = bufnr,
				scope = "cursor",
				focus = false,
			})
		end,
	},
})
