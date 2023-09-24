local status_ok, lsp_status = pcall(require, "lsp-status")
if not status_ok then
	return
end

-- Register the progress handler
lsp_status.register_progress()
lsp_status.config({
	diagnostics = false,
	current_function = true,
	select_symbol = function(cursor_pos, symbol)
		if symbol.valueRange then
			local value_range = {
				["start"] = {
					character = 0,
					line = vim.fn.byte2line(symbol.valueRange[1]),
				},
				["end"] = {
					character = 0,
					line = vim.fn.byte2line(symbol.valueRange[2]),
				},
			}

			return require("lsp-status.util").in_range(cursor_pos, value_range)
		end
	end,
})
