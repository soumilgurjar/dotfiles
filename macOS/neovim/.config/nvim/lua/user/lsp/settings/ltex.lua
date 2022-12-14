local util = require("lspconfig/util")
return {
	settings = {
		ltex = {
			language = "en-GB",
			enabled = false,
			-- enabled = "tex",
		},
	},
	filetypes = {
		"tex",
		"bibtex",
		-- "markdown",
		-- "text",
	},
	root_dir = function(fname)
		return util.root_pattern(".git", "main.tex", ".vimroot", "requirements.txt")(fname) or util.path.dirname(fname)
	end,
}
