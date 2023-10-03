return {
	"folke/flash.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		labels = "fjdkslaghreuiwotyqpvcmxzn",
		jump = {
			rainbow = {
				enabled = true,
				-- number between 1 and 9
				shade = 5,
			},
		},
		modes = {
			char = {
				-- show jump labels
				jump_labels = true,
				-- set to `false` to use the current line only
				multi_line = false,
				highlight = { backdrop = false },
				jump = {
					autojump = true,
				},
			},
		},
		highlight = {
			-- show a backdrop with hl FlashBackdrop
			backdrop = false,
		},
	},
}
