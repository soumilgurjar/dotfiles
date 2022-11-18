local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
	return
end

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
--[[ local lsp_save_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == ("null-ls" or "lemminx")
			-- return true
		end,
		bufnr = bufnr,
	})
end ]]
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local null_ls_servers = {
	-- code_actions
	"gitsigns",
	-- "proselint",
	"shellcheck",
	-- formatting
	"black",
	"beautysh",
	"clang_format",
	"stylua",
	"shfmt",
	"prettierd",
	-- diagnostics
	"flake8",
	"markdownlint",
	"cpplint",
	-- hover
	"dictionary",
}
mason_null_ls.setup({
	ensure_installed = null_ls_servers,
	automatic_installation = true,
})
null_ls.setup({
	debug = false,
    -- stylua: ignore
	sources = {
        -- Use .with() method and pass filetypes, extra_filetypes and disabled_filetypes dictionary if needed
		-- code_actions.proselint,                             -- Injects code actions for prose checking in markdown and tex
		code_actions.gitsigns,                              -- Injects code actions for Git operations at the current cursor position
		code_actions.shellcheck,                            -- Injects code actions for disable ShellCheck errors/warnings
		formatting.black.with({ extra_args = { "--fast" } }), -- Formatter for python
		formatting.stylua,                                  -- Lua formatter
		formatting.shfmt,                                   -- Shell script formatting
		formatting.markdownlint,                            -- Markdown formatter
		formatting.clang_format,                            -- CPP script formatting
		formatting.beautysh.with({ extra_args = { "--indent-size 4", "--tab 4" } }), -- ZSH Shell script formatting
		formatting.prettierd,                               -- Json formatter
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		diagnostics.flake8.with({ extra_args = {"--max-line-length=300", "--ignore=E501"}}),                                 -- Check style and quality of Python code
		-- diagnostics.markdownlint.with({ extra_filetypes = {"vimwiki"}}),                           -- Linter for Markdown
		-- diagnostics.proselint,                              -- English prose linter
		-- diagnostics.shellcheck,                             --shellscript static analysis too
		diagnostics.cpplint.with({ extra_args = { "--indent-size 4", "--tab 4" } }), --C++ diagnostics
		hover.dictionary,                                   --Hover for dictionary
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- Autocommand to format buffer on save
			-- Can be escaped by saving with :noa w[q]
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
				-- callback = function()
				-- 	lsp_save_formatting(bufnr)
				-- end,
			})
		end
	end,
})
