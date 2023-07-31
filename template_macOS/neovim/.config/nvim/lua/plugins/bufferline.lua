return {
	"akinsho/bufferline.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		options = {
			numbers = "none", -- | "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			diagnostics = "",
		},
	},
}
