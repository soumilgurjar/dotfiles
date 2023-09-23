return {
	"gbprod/yanky.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		highlight = {
			on_put = false,
			on_yank = true,
			timer = 200,
		},
		picker = {
			select = {
				action = nil, -- nil to use default put action
			},
			telescope = {
				mappings = nil, -- nil to use default mappings
			},
		},
	},
	keys = {
		-- { "<leader>sy", "<Cmd>Telescope yank_history<CR>", desc = "Yank History" }, -- TODO: Does not work for some reason
		{ "<C-n>", "<Plug>(YankyCycleForward)", desc = "Yank Cycle Forward" },
		{ "<C-p>", "<Plug>(YankyCycleBackward)", desc = "Yank Cycle Backward" },
		{ "gp", vim.NIL, mode = { "n", "x" } },
		{ "gP", vim.NIL, mode = { "n", "x" } },
	},
}
