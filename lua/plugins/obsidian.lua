return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/vaults/thoughts/*.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/vaults/thoughts/*.md",
	},
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false,
		workspaces = {
			{
				name = "thoughts",
				path = "~/vaults/thoughts",
			},
		},
	},
}
