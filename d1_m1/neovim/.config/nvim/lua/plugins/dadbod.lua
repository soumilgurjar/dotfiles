return {
	"tpope/vim-dadbod",
	enabled = true,
	event = "VeryLazy",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
		"kristijanhusak/vim-dadbod-completion",
	},
    -- stylua: ignore
	keys = {
		{ "xu", "<Cmd>DBUIToggle<Cr>", desc = "Database Toggle UI", },
		{ "xf", "<Cmd>DBUIFindBuffer<Cr>", desc = "Database Find Buffer", },
		{ "xr", "<Cmd>DBUIRenameBuffer<Cr>", desc = "Database Rename Buffer", },
		{ "xi", "<Cmd>DBUILastQueryInfo<Cr>", desc = "Database Last Query Info", },
	},
}
