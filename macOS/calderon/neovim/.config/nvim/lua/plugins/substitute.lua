return {
	"gbprod/substitute.nvim",
	enabled = true,
	event = "VeryLazy",
	config = function(_, opts)
		require("substitute").setup(opts)
	end,
	opts = {},
	keys = {
		{
			"gpp",
			function()
				require("substitute").line()
			end,
			desc = "Substitute Line",
		},
		{
			"cx",
			function()
				require("substitute.exchange").operator()
			end,
			desc = "Exchange",
		},
		{
			"cxx",
			function()
				require("substitute.exchange").line()
			end,
			desc = "Exchange Line",
		},
		{
			"cxc",
			function()
				require("substitute.exchange").cancel()
			end,
			desc = "Exchange Cancel",
		},
		{
			"X",
			function()
				require("substitute.exchange").visual()
			end,
			mode = "x",
			desc = "Exchange Visual",
		},
	},
}
