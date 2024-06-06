return {
	"zbirenbaum/copilot.lua",
	enabled = false,
	-- event = "InsertEnter",
	opts = {
		suggestion = { enabled = false, autotrigger = true, keymap = { accept = "<C-y>" } },
		panel = { enabled = false, autorefresh = true, layout = { position = "bottom" }, ratio = 0.8 },
		filetypes = {
			markdown = true,
			help = true,
			gitcommit = true,
		},
	},
}
