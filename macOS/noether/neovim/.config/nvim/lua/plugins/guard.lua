return {
	"nvimdev/guard.nvim", -- Potential null-ls replacement
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local ft = require("guard.filetype")

		ft("c,cpp"):fmt("clang-format")
		ft("lua"):fmt("stylua")
		ft("python"):fmt({ cmd = "black", args = { "--quiet", "-" }, stdin = true })
		ft("sh"):fmt("shfmt")
		-- ft("javascript,typescript,javascriptreact,typescriptreact,json"):fmt("prettierd")
		ft("tex"):fmt("latexindent")
		require("guard").setup({
			-- the only options for the setup function
			fmt_on_save = true,
			-- Use lsp if no formatter was defined for this filetype
			lsp_as_default_formatter = true,
		})
	end,
}
