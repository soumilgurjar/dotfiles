return {
	"akinsho/toggleterm.nvim",
	enabled = true,
	version = "*",
	event = "VeryLazy",
	config = true,
	opts = {
		size = 100,
		open_mapping = [[<c-\>]],
		shading_factor = 2,
		persist_size = true,
		direction = "vertical",
		float_opts = {
			border = "curved",
		},
	},
}
