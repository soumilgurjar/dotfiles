return {
	"gbprod/substitute.nvim",
	enabled = true,
	event = "VeryLazy",
	config = function(_, opts)
		require("substitute").setup(opts)
	end,
	opts = {
		on_substitute = require("yanky.integration").substitute(),
	},
	keys = {
		{
			"gp",
			function()
				require("substitute").operator()
			end,
			desc = "Substitute",
		},
		{
			"gpp",
			function()
				require("substitute").line()
			end,
			desc = "Substitute Line",
		},
		{
			"gP",
			function()
				require("substitute").eol()
			end,
			desc = "Substitute EOL",
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
