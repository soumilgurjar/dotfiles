return {
	"lervag/vimtex",
	enabled = true,
	lazy = false,
	keys = {
		{ "<localleader>;", "<Cmd>VimtexCompileSS<CR>", desc = "Latex Compile (Singleshot)" },
		{ "<localleader>l;", "<Cmd>VimtexStop<CR>", desc = "Latex Compile Stop" },
	},
	init = function()
		vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
		vim.g.vimtex_quickfix_open_on_warning = 1
		vim.g.vimtex_syntax_conceal_disable = 1
		vim.g.vimtex_fold_enabled = 1
		vim.g.vimtex_fold_manual = 1
		vim.g.vimtex_compiler_latexmk = { out_dir = "build", aux_dir = "build" }
		vim.g.vimtex_view_method = "sioyek"
	end,
}
