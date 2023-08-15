return {
	"folke/trouble.nvim",
	enabled = true,
	event = "VeryLazy",
	keys = {
		{ "gR", "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP References (Trouble)" },
	},
}
