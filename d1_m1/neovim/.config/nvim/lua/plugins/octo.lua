return {
	"pwntester/octo.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	enabled = true,
	event = "VeryLazy",
	config = function()
		require("octo").setup()
	end,
}
