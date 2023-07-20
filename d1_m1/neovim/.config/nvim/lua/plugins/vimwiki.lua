return {
	"vimwiki/vimwiki",
	branch = "dev",
	lazy = false,
	enabled = true,
	event = "VeryLazy",
	-- NOTE: "<leader>ww" for "<Cmd>VimwikiIndex<CR>" does not work due to conflict with existing keymap
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/Dropbox/Apps/vimwiki/",
				syntax = "markdown",
				ext = ".md",
				links_space_char = "-",
				auto_diary_index = 1,
			},
		}
		vim.g.vimwiki_markdown_link_ext = 1 -- Generates links as [text](text.md)
		vim.g.vimwiki_global_ext = 0
		vim.g.vimwiki_hl_headers = 1 -- Generates headers with different colors

		local keymap = vim.keymap.set
		local opts = { buffer = true, silent = true }

		vim.api.nvim_create_autocmd({ "FileType" }, {
			desc = "Wrap and spell languages on for vimwiki filetypes",
			pattern = { "vimwiki" },
			callback = function()
				vim.opt_local.wrap = true
				vim.opt_local.spelllang = "en_gb,de_ch" -- Set spell language to English and German
				vim.opt_local.spell = false
				keymap({ "n", "v" }, "j", "gj", opts)
				keymap({ "n", "v" }, "k", "gk", opts)
				keymap({ "n" }, "<Right>", "g$", opts)
				keymap({ "n" }, "<Left>", "g^", opts)
			end,
		})
	end,
}
