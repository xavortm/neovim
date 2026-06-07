return {
	cmd = { "vscode-html-language-server", "--stdio" },
	root_markers = { "package.json", ".git" },
	filetypes = { "html", "templ" },
	init_options = {
		provideFormatter = true,
		embeddedLanguages = { css = true, javascript = true },
		configurationSection = { "html", "css", "javascript" },
	},
	settings = {
		html = {
			format = { enable = true },
			validate = { scripts = true, styles = true },
		},
	},
}
