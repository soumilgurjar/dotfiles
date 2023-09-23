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
	},
	keys = {
		-- { "<leader>sy", "<Cmd>Telescope yank_history<CR>", desc = "Yank History" }, -- TODO: Does not work for some reason
		{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Yank Put After" },
		{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Yank Put Before" },
		{ "<C-n>", "<Plug>(YankyCycleForward)", desc = "Yank Cycle Forward" },
		{ "<C-p>", "<Plug>(YankyCycleBackward)", desc = "Yank Cycle Backward" },
	},
	picker = {
		select = {
			action = nil, -- nil to use default put action
		},
		telescope = {
			use_default_mappings = true, -- if default mappings should be used
			mappings = nil, -- nil to use default mappings
		},
	},
}
