local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

local function keymap(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("keep", opts, { silent = true })
	vim.keymap.set(mode, lhs, rhs, opts)
end

trouble.setup({
	use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
})

-- TODO: Move to appropriate place and consider switching keybinding to <leader>tt
keymap("n", "<leader>xx", "<Cmd>TroubleToggle<CR>", { desc = "Trouble Toggle" })
keymap("n", "<leader>xw", "<Cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Trouble Workspace" })
keymap("n", "<leader>xd", "<Cmd>TroubleToggle document_diagnostics<CR>", { desc = "Trouble Document" })
keymap("n", "<leader>xl", "<Cmd>TroubleToggle loclist<CR>", { desc = "Trouble Loclist" })
keymap("n", "<leader>xq", "<Cmd>TroubleToggle quickfix<CR>", { desc = "Trouble Quickfix" })
keymap("n", "gR", "<Cmd>TroubleToggle lsp_references<CR>", { desc = "Trouble LSP References" })
