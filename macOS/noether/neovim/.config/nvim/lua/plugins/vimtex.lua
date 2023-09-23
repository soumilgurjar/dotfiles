return {
	"lervag/vimtex",
	enabled = true,
	lazy = false,
	config = function()
		vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
		vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
		vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
		vim.g.vimtex_quickfix_open_on_warning = 1
		vim.g.vimtex_syntax_conceal_disable = 1
		vim.g.vimtex_fold_enabled = 1
		vim.g.vimtex_fold_manual = 1
		vim.g.vimtex_compiler_latexmk = { out_dir = "build", aux_dir = "build" }
		vim.g.vimtex_view_method = "sioyek"
	end,
}
