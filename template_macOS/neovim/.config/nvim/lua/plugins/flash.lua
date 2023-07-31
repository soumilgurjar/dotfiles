return {
	"folke/flash.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		labels = "fjdkslaghreuiwotyqpvcmxzn",
		modes = {
			char = {
				-- show jump labels
				jump_labels = true,
				-- set to `false` to use the current line only
				multi_line = false,
				highlight = { backdrop = false },
			},
		},
		highlight = {
			-- show a backdrop with hl FlashBackdrop
			backdrop = false,
		},
	},
}
