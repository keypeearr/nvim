return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			mode = "n",
			"<leader>F",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = true,
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			go = {
				"goimports-reviser",
				"gofumpt",
				"golines",
				"goimports",
				"gomodifytags",
			},
			templ = {
				"templ",
			},
			sql = { "sql-formatter" },
			javascript = { "prettierd", "biome" },
			typescript = { "prettierd", "biome" },
		},
	},
}
