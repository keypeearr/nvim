return {
	"esmuellert/vscode-diff.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		highlights = {
			line_insert = "DiffAdd",
			line_delete = "DiffDelete",
			char_insert = nil,
			char_delete = nil,
			char_brightness = nil,
		},
		diff = {
			disable_inlay_hints = true,
			max_computation_time_ms = 5000,
		},
		keymaps = {
			view = {
				next_hunk = "]c",
				prev_hunk = "[c",
				next_file = "]f",
				prev_file = "[f",
			},
			explorer = {
				select = "<CR>",
				hover = "K",
				refresh = "R",
			},
		},
	},
	keys = {
		{ mode = "n", "<leader>vd", "<CMD>CodeDiff<CR>", desc = "[V]iew [D]iff" },
	},
}
