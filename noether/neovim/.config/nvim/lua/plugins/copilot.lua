return {
	"zbirenbaum/copilot.lua",
	enabled = true,
	-- event = "InsertEnter",
	opts = {
		-- suggestion = { enabled = true, autotrigger = true, keymap = { accept = "<C-y>" } },
		-- panel = { enabled = true, autorefresh = true, layout = { position = "bottom" }, ratio = 0.8 },
		suggestion = { enabled = false, autotrigger = true, keymap = { accept = "<C-y>" } },
		panel = { enabled = false, autorefresh = true, layout = { position = "bottom" }, ratio = 0.8 },
		filetypes = {
			markdown = true,
			help = true,
			gitcommit = true,
		},
	},
}
