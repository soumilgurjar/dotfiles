local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

local status_navic_ok, navic = pcall(require, "nvim-navic")
if not status_navic_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = true, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

--[[ local lsp_formatting = function()
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == ("null-ls" or "lemminx")
			-- return true
		end,
	})
end ]]
local function lsp_keymaps(bufnr)
	-- TODO: Add descriptions
	local keymap = vim.keymap.set
	local opts = { buffer = bufnr, silent = true }
	-- keymap("n", "<leader>la", vim.lsp.buf.code_action, opts)
	-- keymap("n", "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>", opts)
	-- keymap("n", "<leader>lD", "<cmd>Telescope lsp_workspace_diagnostics<cr>", opts)
	keymap({ "n", "v" }, "<leader>lf", vim.lsp.buf.format, opts)
	keymap("n", "<leader>lj", vim.diagnostic.goto_next, opts)
	keymap("n", "<leader>lk", vim.diagnostic.goto_prev, opts)
	keymap("n", "<leader>lq", vim.diagnostic.setloclist, opts)
	keymap("n", "<leader>lr", vim.lsp.buf.rename, opts)
	keymap("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
	keymap("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<CR>", opts)
	-- keymap("n", "K", vim.lsp.buf.hover, opts)
	keymap("n", "gD", vim.lsp.buf.declaration, opts)
	keymap("n", "gI", vim.lsp.buf.implementation, opts)
	keymap("n", "gdd", vim.lsp.buf.definition, opts)
	keymap("n", "gl", vim.diagnostic.open_float, opts)
	-- keymap("n", "gR", vim.lsp.buf.references, opts)
	-- keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
end

M.on_attach = function(client, bufnr)
	-- Never recommended to format typescript
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
	-- Formatting with Stylua, hence need to disable sumneko_lua to not have multiple choices
	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end
	-- Navic winbar attaching to lsp that can provide symbols    ...
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	lsp_keymaps(bufnr)
end

return M
