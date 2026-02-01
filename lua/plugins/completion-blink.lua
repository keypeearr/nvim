return {
	"saghen/blink.cmp",
	event = "VimEnter",
	dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		enabled = function()
			return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
		end,
		keymap = { preset = "enter" },
		snippets = { preset = "luasnip" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			menu = {
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(
										ctx.item.documentation,
										{ kind = ctx.kind }
									)
									if color_item and color_item.abbr ~= "" then
										icon = color_item.abbr
									end
								end
								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								local highlight = "BlinkCmpKind" .. ctx.kind
								if ctx.item.source_name == "LSP" then
									local color_item = require("nvim-highlight-colors").format(
										ctx.item.documentation,
										{ kind = ctx.kind }
									)
									if color_item and color_item.abbr_hl_group then
										highlight = color_item.abbr_hl_group
									end
								end
								return highlight
							end,
						},
					},
				},
			},
		},
		signature = { enabled = true },
		sources = {
			default = { "lsp", "buffer", "snippets", "path" },
			per_filetype = {
				sql = { "snippets", "dadbod", "buffer" },
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
