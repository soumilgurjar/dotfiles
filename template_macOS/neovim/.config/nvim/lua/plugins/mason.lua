return {
	"williamboman/mason.nvim",
	enabled = true,
	opts = {
		ensure_installed = {
			"stylua",
			"shfmt",
			"sqlfluff",
			"sql-formatter",
			"black",
			"ruff-lsp",
			"pyright",
		},
	},
}
