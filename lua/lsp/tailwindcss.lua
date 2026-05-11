return {
	filetypes = {
		"html",
		"templ",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"css",
		"scss",
	},

	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "class[:]?\\s*[\"'`]([^\"'`]*)" },
					{ "className[:]?\\s*[\"'`]([^\"'`]*)" },
					{ "class:list=\\{([^}]*)\\}", "[\"'`]([^\"'`]*)[\"'`]" },
					{ "(?:clsx|cva|cn|tw|twMerge)\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" },
				},
			},
		},
	},
}
