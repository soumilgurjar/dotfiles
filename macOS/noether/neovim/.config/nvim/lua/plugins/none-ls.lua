return {
	"nvimtools/none-ls.nvim",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	keys = {
		{ "<leader>ln", "<Cmd>NullLsInfo<CR>", desc = "Show Null-ls Info" },
	},
	opts = function()
		local nls = require("null-ls")
		return {
			root_dir = require("null-ls.utils").root_pattern(
				".null-ls-root",
				".neoconf.json",
				"Makefile",
				".git",
				".vimroot"
			),
			sources = {
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.shfmt,
				nls.builtins.formatting.black,
				nls.builtins.diagnostics.sqlfluff.with({
					extra_args = { "--dialect", "postgresql" }, -- change to your dialect
				}),
				nls.builtins.formatting.sql_formatter.with({
					extra_args = { "--dialect", "postgresql" }, -- change to your dialect
				}),
				nls.builtins.formatting.clang_format,
			},
		}
	end,
}
