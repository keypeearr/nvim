return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		"telescope",
		previewers = {
			builtin = {
				snacks_image = { enabled = false },
			},
		},
	},
	keys = {
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "[F]ind [H]elp",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[F]ind [K]eymaps",
		},
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "[F]ind [F]iles",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "[F]ind current [W]ord",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "[F]ind [G]rep",
		},
		{
			"<leader>fdd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "[F]ind [D]iagnostics [D]ocument",
		},
		{
			"<leader>fdw",
			function()
				require("fzf-lua").diagnostics_workspace()
			end,
			desc = "[F]ind [D]iagnostics [W]orkspace",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").resume()
			end,
			desc = "[F]ind [R]esume",
		},
		{
			"<leader>f.",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "[F]ind [.]Recent Files",
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "[ ][ ] Find in Buffers",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").blines()
			end,
			desc = "[ ][/] Find in current Buffer",
		},
		{
			"<leader>f/",
			function()
				require("fzf-lua").lines()
			end,
			desc = "[F]ind [/] in Open Buffers",
		},
		{
			"<leader>fn",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[F]ind [N]eovim Files",
		},
	},
}
