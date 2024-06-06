return {
	"jackMort/ChatGPT.nvim",
	enabled = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>k", desc = "+chatgpt" },
		{ "<leader>kd", "<Cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
		{ "<leader>ke", "<Cmd>ChatGPT<CR>", desc = "ChatGPT" },
		{ "<leader>kf", "<Cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
		{ "<leader>kg", "<Cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
		{ "<leader>kk", "<Cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", mode = { "n", "v" } },
		{ "<leader>ko", "<Cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
		{ "<leader>kr", "<Cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", mode = { "n", "v" } },
		{ "<leader>ks", "<Cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
		{ "<leader>kt", "<Cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
		{ "<leader>kw", "<Cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
		{ "<leader>kx", "<Cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
		{ "<leader>kz", "<Cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
		{
			"<leader>kl",
			"<Cmd>ChatGPTRun code_readability_analysis<CR>",
			desc = "Code Readability Analysis",
			mode = { "n", "v" },
		},
	},
	config = function()
		require("chatgpt").setup({
			api_key_cmd = "pass show api/tokens/openai/chatgpt.nvim",
		})
	end,
}
