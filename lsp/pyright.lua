return {
	cmd = { "pyright", "--lsp", "--stdio" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
	filetypes = {
		"python",
	},
}
