local keymap = vim.keymap.set
local opts = { buffer = true, silent = true }

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Easy quit in read-only filetypes",
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "fugitive", "lspsagaoutline" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :q<CR> 
      set nobuflisted 
    ]])
	end,
})

-- Need to set this here as it gets overwritten when set with vim.opt
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	desc = "No continuation of comments on next line",
	callback = function()
		vim.cmd("set formatoptions-=cro")
		vim.cmd("setlocal keywordprg=:help")
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	desc = "Equal window sizes",
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	desc = "Quits immediately after entering Command-line Window",
	callback = function()
		vim.cmd("quit")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	desc = "Highlight yank for short time",
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 700 })
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Wrap and spell on for git commits",
	pattern = { "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Wrap and spell on for prose filetypes",
	pattern = { "text" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spelllang = "en_gb,de_ch" -- Set spell language to English and German
		vim.opt_local.spell = true
		keymap({ "n", "v" }, "j", "gj", opts)
		keymap({ "n", "v" }, "k", "gk", opts)
		keymap({ "n" }, "<Right>", "g$", opts)
		keymap({ "n" }, "<Left>", "g^", opts)
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Wrap and spell on for tex filetypes",
	pattern = { "markdown", "vimwiki", "tex" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spelllang = "en_gb,de_ch" -- Set spell language to English and German
		-- vim.opt_local.spell = true
		keymap({ "n", "v" }, "j", "gj", opts)
		keymap({ "n", "v" }, "k", "gk", opts)
		keymap({ "n" }, "<Right>", "g$", opts)
		keymap({ "n" }, "<Left>", "g^", opts)
	end,
})

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	desc = "Refresh codelens on saving java files",
	pattern = { "*.java" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Auto filetype detect for gitlab and github configs",
	pattern = { "*.gitconfig-*" },
	callback = function()
		vim.opt_local.filetype = "gitconfig"
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Better header highlights for vimwiki",
	pattern = { "vimwiki" },
	callback = function()
		vim.cmd("highlight link VimwikiHeader2 GruvboxYellowBold")
		vim.cmd("highlight link VimwikiHeader3 GruvboxAquaBold")
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "No tab expansion for devicetree filetypes",
	pattern = { "devicetree" },
	callback = function()
		vim.opt_local.wrap = false
		vim.opt_local.expandtab = false
	end,
})
