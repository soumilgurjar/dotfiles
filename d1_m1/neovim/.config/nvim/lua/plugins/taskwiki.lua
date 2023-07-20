return {
	"tools-life/taskwiki",
	enabled = true,
	event = "VeryLazy",
	init = function()
		--[[ vim.g.taskwiki_disable="yes" ]]
		--[[ vim.g.taskwiki_suppress_mappings="yes" ]]
		vim.g.taskwiki_dont_fold = "yes"
		vim.g.taskwiki_markup_syntax = "markdown" -- Has no documentation as of 20 Apr 2022
		vim.g.taskwiki_disable_concealcursor = "no"
	end,
}
