vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
	pattern = { "bib", "tex" },
	callback = function()
		vim.wo.conceallevel = 2
	end,
})

vim.keymap.set({ "n", "v" }, "<localleader>;", "<Cmd>VimtexCompileSS<CR>", { desc = "Latex Compile (Singleshot)" })
vim.keymap.set({ "n", "v" }, "<localleader>l;", "<Cmd>VimtexStop<CR>", { desc = "Latex Compile Stop" })
