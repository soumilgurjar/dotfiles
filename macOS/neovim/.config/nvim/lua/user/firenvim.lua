-- local status_ok, firenvim = pcall(require, "firenvim")
-- if not status_ok then
-- 	return
-- end

vim.g.firenvim_config = {
	-- globalSettings = { alt = "all", },
	localSettings = {
		[".*"] = {
			cmdline = "neovim",
			content = "text",
			priority = 0,
			selector = "textarea",
			takeover = "never",
		},
	},
}
