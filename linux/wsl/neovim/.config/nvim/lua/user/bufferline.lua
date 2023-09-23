local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

local status_ok_2, catppuccin_bufferline = pcall(require, "catppuccin.groups.integrations.bufferline")
if not status_ok_2 then
	return
end
local cp = require("catppuccin.palettes").get_palette()

bufferline.setup({
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		-- numbers = function(opts) return string.format('%s', opts.raise(opts.ordinal)) end, -- | "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		numbers = "ordinal", -- | "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "icon", -- 'icon' | 'underline' | 'none',
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 14,
		diagnostics = false, -- "false" | "nvim_lsp" | "coc",
		diagnostics_update_in_insert = false,
		-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
		-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
		--     return "("..count..")"
		-- end,
		-- -- NOTE: this will be called a lot so don't do any heavy processing here
		-- custom_filter = function(buf_number, buf_numbers)
		--     -- filter out filetypes you don't want to see
		--     if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
		--         return true
		--     end
		--     -- filter out by buffer name
		--     if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
		--         return true
		--     end
		--     -- filter out based on arbitrary rules
		--     -- e.g. filter out vim wiki buffer from tabline in your work repo
		--     if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
		--         return true
		--     end
		--     -- filter out by it's index number in list (don't show first buffer)
		--     if buf_numbers[1] ~= buf_number then
		--         return true
		--     end
		-- end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer", -- | function ,
				text_align = "center", -- "left" | "center" | "right"
				separator = true,
			},
		},
		color_icons = true, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		-- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
		--     -- add custom logic
		--     return buffer_a.modified > buffer_b.modified
		-- end
		-- custom_filter = function(buf_number)
		-- 	if not not vim.api.nvim_buf_get_name(buf_number):find(vim.fn.getcwd(), 0, true) then
		-- 		return true
		-- 	end
		-- end,
		-- highlights = catppuccin_bufferline.get(),
		highlights = catppuccin_bufferline.get({
			custom = {
				machiatto = {
					background = { bg = cp.base },
				},
			},
		}),
	},
})

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Navigate buffers
keymap("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
keymap("n", "<leader>0", "<Cmd>BufferLineGoToBuffer -1<CR>", opts)
