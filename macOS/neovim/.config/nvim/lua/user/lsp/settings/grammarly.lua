local util = require("lspconfig/util")
return {
	settings = {
		grammarly = {},
	},
	filetypes = {
		"text",
		-- "tex",
		-- "markdown",
		-- "bibtex",
	},
	root_dir = function(fname)
		return util.root_pattern(".git", "main.tex", ".vimroot", "requirements.txt")(fname) or util.path.dirname(fname)
	end,
}
