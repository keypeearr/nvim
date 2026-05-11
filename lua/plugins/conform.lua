return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = true,
		format_on_save = {
			timeout_ms = 1500,
			lsp_format = "fallback",
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			-- Lua
			lua = { "stylua" },
			-- Go
			go = {
				"goimports-reviser",
				"gofumpt",
				"golines",
			},
			-- Web
			javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
			typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
			json = { "biome", "prettierd", stop_after_first = true },
			jsonc = { "biome", "prettierd", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			scss = { "prettierd", "prettier", stop_after_first = true },
			-- Templ
			templ = { "templ" },
			-- SQL
			sql = { "sqlfmt", "sql-formatter", stop_after_first = true },
			-- Markdown
			markdown = { "prettierd", "prettier", stop_after_first = true },
			-- YAML
			yaml = { "prettierd", "prettier", stop_after_first = true },
		},
		formatters = {
			golines = {
				prepend_args = {
					"--max-len=120",
				},
			},
			gofumpt = {
				prepend_args = {
					"-extra",
				},
			},
			biome = {
				require_cwd = true,
			},
			prettierd = {
				require_cwd = true,
			},
			prettier = {
				require_cwd = true,
			},
		},
	},
}
