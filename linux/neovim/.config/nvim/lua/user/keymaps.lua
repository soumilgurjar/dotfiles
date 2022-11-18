-- Shorten function name
local function keymap(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("keep", opts, { noremap = true, silent = true })
	vim.keymap.set(mode, lhs, rhs, opts)
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", { desc = "" })
vim.g.mapleader = " "
--Remap backspace as localleader key
-- HACK:Unable to get backspace working with lua code, hence use of vimscript
vim.cmd([[let maplocalleader = "\<BS>"]])

-- Modes
-- normal_mode = "n", insert_mode = "i", visual_mode = "v", visual_block_mode = "x", term_mode = "t", command_mode = "c",

------------------------------- Normal -----------------------------------------
-- Better buffer navigation
keymap("n", "<Up>", "<C-b>", { desc = "Page Up" })
keymap("n", "<Down>", "<C-f>", { desc = "Page Down" })
keymap("n", "<Left>", "^", { desc = "Start of Line" })
keymap("n", "<Right>", "$", { desc = "End of Line" })
keymap("n", "<Leader>`", "<C-6>", { desc = "Previous Buffer" })

-- Better window navigation
keymap("n", "<Leader>kj", "<C-w>h", { desc = "Switch to left window" })
keymap("n", "<Leader>jk", "<C-w>l", { desc = "Switch to right window" })
keymap("n", "<Leader>jj", "<C-w>j", { desc = "Switch to lower window" })
keymap("n", "<Leader>kk", "<C-w>k", { desc = "Switch to upper window" })

-- Resize with arrows
keymap("n", "<C-Up>", "<Cmd>resize -2<CR>", { desc = "Reduce vertical size" })
keymap("n", "<C-Down>", "<Cmd>resize +2<CR>", { desc = "Increase vertical size" })
keymap("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Reduce horizontal size" })
keymap("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Reduce horizontal size" })

-- Column selection
keymap("n", "<Leader>vv", "<C-v>", { desc = "Column visual selection" })

-- Move text up and down
keymap("n", "∆", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "˚", ":m .-2<CR>==", { desc = "Move line up" })

-- Remove highlight
keymap("n", "<Leader>hl", "<Cmd>nohlsearch<CR>", { desc = "Remove highlighting" })

-- Repeat last used macro
keymap({ "n" }, ",", "<Cmd>norm @@<CR>", { desc = "Repeat last used macro or command" })
-- Repeat last command from command line
keymap({ "n", "v" }, ",", "<cmd>norm @:<CR>", { desc = "Repeat last command" })

-- Save and quit buffers and windows
keymap("n", ";", "<Cmd>update<CR>", { desc = "Save Buffer" })
keymap("n", "<Leader>;", "<Cmd>wall<CR>", { desc = "Save All Buffers" })
keymap("n", "q", "<Cmd>Bdelete<CR>", { desc = "Quit Buffer" })
keymap("n", "<Leader>q", "<Cmd>qall<CR>", { desc = "Quit All Buffers and Splits" })
keymap("n", "<Leader>wq", "<Cmd>close<CR>", { desc = "Quit Window" })
keymap("n", "<Leader>wo", "<Cmd>only<CR>", { desc = "Quit All Other Window" })

-- Start macro with Q instead of q
keymap("n", "<S-q>", "q", { desc = "Start Macro" })

-- Easy copying to end of line
keymap("n", "<S-y>", "y$", { desc = "Copy to end of line" })

-- Split line at cursor (opposite of J)
keymap("n", "<leader>J", "i<CR><Esc>g;", { desc = "Split line at cursor" })

-- Insert line above and below current line
keymap("n", "oo", "mno<Esc>`n", { desc = "Insert line below" })
keymap("n", "OO", "mnO<Esc>`n", { desc = "Insert line above" })

-- Keep paste register clean
keymap("n", "x", '"_x', { desc = "Delete Character" })

------------------------------- Insert -----------------------------------------
-- Press jj/jk/JJ/ZZ fast to exit insert mode
keymap("i", "jj", "<ESC>", { desc = "Go to normal mode" })
keymap("i", "jk", "<ESC>", { desc = "Go to normal mode" })
keymap("i", "JJ", "<ESC>", { desc = "Go to normal mode" })

-- Press ZZ fast to exit insert mode and save
keymap("i", "ZZ", "<ESC>:wq<CR>", { desc = "Save from insert mode" })

-- Move text up and down
keymap("i", "∆", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
keymap("i", "˚", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })

-- Undo checkpoints
keymap("i", "<C-w>", "<C-g>u<C-w>", { desc = "Delete last word" })
keymap("i", "<C-u>", "<C-g>u<C-u>", { desc = "Delete line" })
keymap("i", ".", ".<C-g>u", { desc = "" })
keymap("i", ",", ",<C-g>u", { desc = "" })
keymap("i", "?", "?<C-g>u", { desc = "" })
keymap("i", "!", "!<C-g>u", { desc = "" })
keymap("i", ":", ":<C-g>u", { desc = "" })
keymap("i", ";", ";<C-g>u", { desc = "" })
keymap("i", "(", "<C-g>u(", { desc = "" })
keymap("i", ")", ")<C-g>u", { desc = "" })

------------------------------- Visual -----------------------------------------
-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
keymap("v", "∆", ":m .+1<CR>==", { desc = "Move line down" })
keymap("v", "˚", ":m .-2<CR>==", { desc = "Move line up" })
keymap("v", "p", '"_dP', { desc = "Paste" })

-- Better buffer navigation in visual mode
keymap("v", "<Up>", "<C-b>", { desc = "Scroll page up" })
keymap("v", "<Down>", "<C-f>", { desc = "Scroll page down" })
keymap("v", "<Left>", "^", { desc = "Beginning of Line" })
keymap("v", "<Right>", "$", { desc = "End of Line" })

------------------------------- Visual Block -----------------------------------------
-- Move text up and down
keymap("x", "∆", ":move '>+1<CR>gv-gv", { desc = "Move Block down" })
keymap("x", "˚", ":move '<-2<CR>gv-gv", { desc = "Move Block up" })

-- Text Objects --
-- Line Operator
keymap("x", "il", ":<C-u>normal! g_v^<CR>", { desc = "Operate inside line" })
keymap("x", "al", ":<C-u>normal! $v0<CR>", { desc = "Operate around line" })
keymap("o", "il", ":<C-u>normal! g_v^<CR>", { desc = "Operate inside line" })
keymap("o", "al", ":<C-u>normal! $v0<CR>", { desc = "Operate around line" })

------------------------- Plugin Specific Mappings ---------------------------------
-- NullLs
keymap("n", "<leader>ln", "<cmd>NullLsInfo<cr>", { desc = "Show NullLs Info " })
-- LSP
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Show LSP Info " })
-- Telescope
-- TODO: Inserts weird A at the end of the current word
vim.cmd([[nnoremap <expr> <leader>K ':Telescope help_tags<cr>' . "A" . expand('<cword>') ]])
