-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Need to set this here as it gets overwritten when set with vim.opt
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	desc = "No continuation of comments on next line",
	group = vim.api.nvim_create_augroup("discontinue_comments", { clear = true }),
	callback = function()
		vim.cmd("set formatoptions-=cro")
		vim.cmd("setlocal keywordprg=:help")
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = vim.api.nvim_create_augroup("resize_windows", { clear = true }),
	desc = "Equal window sizes",
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	desc = "Quits immediately after entering Command-line Window",
	group = vim.api.nvim_create_augroup("quit_command_line", { clear = true }),
	callback = function()
		vim.cmd("quit")
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Always open help filetypes in a vertical split",
	group = vim.api.nvim_create_augroup("help_vertical_split", { clear = true }),
	pattern = { "help" },
	callback = function()
		vim.cmd("wincmd L")
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Wrap and spell on for prose filetypes",
	group = vim.api.nvim_create_augroup("wrap_spell_text", { clear = true }),
	pattern = { "text" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spelllang = "en_gb,de_ch" -- Set spell language to English and German
		-- vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Wrap and spell on for tex filetypes",
	group = vim.api.nvim_create_augroup("wrap_spell_markdown_tex", { clear = true }),
	pattern = { "markdown", "tex" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spelllang = "en_gb,de_ch" -- Set spell language to English and German
		-- vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	desc = "Refresh codelens on saving java files",
	group = vim.api.nvim_create_augroup("refresh_java_codelens", { clear = true }),
	pattern = { "*.java" },
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "No wrapping for devicetree filetypes",
	group = vim.api.nvim_create_augroup("disable_wrap_devicetree", { clear = true }),
	pattern = { "dts" },
	callback = function()
		vim.opt_local.wrap = false
		-- vim.opt_local.expandtab = false
	end,
})
