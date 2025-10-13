return {
	cmd = { "tsgo", "--lsp", "--stdio" },
	root_markers = {
		"tsconfig.json",
		"jsconfig.json",
		"package.json",
		".git",
		"tsconfig.base.json",
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
}
