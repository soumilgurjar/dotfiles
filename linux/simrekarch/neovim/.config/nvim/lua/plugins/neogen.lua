return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = true,
	enabled = true,
	keys = {
		{ "<leader>cn", "<Cmd>Neogen<CR>", desc = "Generate Neogen annotation" },
	},
	languages = {
		python = {
			template = {
				annotation_convention = "google_docstrings",
			},
		},
	},
	-- opts = {
	-- 	input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
	-- },
}
