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
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Trouble Toggle" })
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Trouble Workspace" })
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Trouble Document" })
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "Trouble Loclist" })
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Trouble Quickfix" })
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { desc = "Trouble LSP References" })
