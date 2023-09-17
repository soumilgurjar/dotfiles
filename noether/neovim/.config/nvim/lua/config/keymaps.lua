-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Shorten function name
local function keymap(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("keep", opts, { noremap = true, silent = true })
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Modes
-- normal_mode = "n", insert_mode = "i", visual_mode = "v", visual_block_mode = "x", term_mode = "t", command_mode = "c",

------------------------------- Normal -----------------------------------------
-- Better buffer navigation
keymap({ "n", "v" }, "<Up>", "<C-b>", { desc = "Page Up" })
keymap({ "n", "v" }, "<Down>", "<C-f>", { desc = "Page Down" })
keymap({ "n", "v" }, "<Left>", "g^", { desc = "Start of Line" })
keymap({ "n", "v" }, "<Right>", "g$", { desc = "End of Line" })

-- Move text up and down
keymap({ "n" }, "∆", ":m .+1<CR>==", { desc = "Move line down" })
keymap({ "n" }, "˚", ":m .-2<CR>==", { desc = "Move line up" })

-- Repeat last used macro
keymap({ "n" }, ",", "<Cmd>norm @@<CR>", { desc = "Repeat last used macro or command" })
-- Repeat last command from command line
keymap({ "n", "v" }, "<leader>,", "<Cmd>norm @:<CR>", { desc = "Repeat last command" })

-- Save and quit buffers and windows
keymap({ "n" }, ";", "<Cmd>update<CR>", { desc = "Save Buffer" })
keymap({ "n" }, "<leader>;", "<Cmd>wall<CR>", { desc = "Save All Buffers" })
keymap({ "n" }, "q", "<Cmd>lua require('mini.bufremove').delete(n, false)<CR>", { desc = "Quit Buffer" })
keymap({ "n" }, "<leader>qq", "<Cmd>qall<CR>", { desc = "Quit All Buffers and Splits" })
keymap({ "n" }, "<leader>wq", "<Cmd>close<CR>", { desc = "Quit Window" })
keymap({ "n" }, "<leader>wo", "<Cmd>only<CR>", { desc = "Quit All Other Window" })

-- Start macro with Q instead of q
keymap({ "n" }, "<S-q>", "q", { desc = "Start Macro" })

-- Create mark with M and go to mark with m
keymap({ "n" }, "<S-m>", "m", { desc = "Create Mark" })
keymap({ "n" }, "m", "`", { desc = "Go to Mark" })

-- Easy copying to end of line
keymap({ "n" }, "<S-y>", "y$", { desc = "Copy to end of line" })

-- Split line at cursor (opposite of J)
keymap({ "n" }, "<leader>J", "i<CR><Esc>g;", { desc = "Split line at cursor" })

-- Insert line above and below current line
keymap({ "n" }, "o", "o", { desc = "Insert line below and go to insert mode" })
keymap({ "n" }, "O", "O", { desc = "Insert line above and go to insert mode" })
keymap({ "n" }, "oo", "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>", { desc = "Insert line below" })
keymap({ "n" }, "OO", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Insert line above" })

-- Keep paste register clean
keymap({ "n" }, "x", '"_x', { desc = "Delete Character" })

------------------------------- Insert -----------------------------------------
-- Press jj/jk/JJ/ZZ fast to exit insert mode
keymap({ "i" }, "jj", "<Esc>", { desc = "Go to normal mode" })
keymap({ "i" }, "jk", "<Esc>", { desc = "Go to normal mode" })
keymap({ "i" }, "kk", "<Esc>", { desc = "Go to normal mode" })
keymap({ "i" }, "JJ", "<Esc>", { desc = "Go to normal mode" })

-- Press ZZ fast to exit insert mode and save
keymap({ "i" }, "ZZ", "<Esc>:wq<CR>", { desc = "Save from insert mode" })

-- Move text up and down
keymap({ "i" }, "∆", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
keymap({ "i" }, "˚", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })

-- Undo checkpoints
keymap({ "i" }, "<C-w>", "<C-g>u<C-w>", { desc = "Delete last word" })
keymap({ "i" }, "<C-u>", "<C-g>u<C-u>", { desc = "Delete line" })
keymap({ "i" }, ".", ".<C-g>u", { desc = "" })
keymap({ "i" }, ",", ",<C-g>u", { desc = "" })
keymap({ "i" }, "?", "?<C-g>u", { desc = "" })
keymap({ "i" }, "!", "!<C-g>u", { desc = "" })
keymap({ "i" }, ":", ":<C-g>u", { desc = "" })
keymap({ "i" }, ";", ";<C-g>u", { desc = "" })
keymap({ "i" }, "(", "<C-g>u(", { desc = "" })
keymap({ "i" }, ")", ")<C-g>u", { desc = "" })

------------------------------- Visual -----------------------------------------
-- Stay in indent mode
keymap({ "v" }, "<", "<gv", { desc = "Indent left" })
keymap({ "v" }, ">", ">gv", { desc = "Indent right" })

-- Move text up and down
keymap({ "v" }, "∆", ":m .+1<CR>==", { desc = "Move line down" })
keymap({ "v" }, "˚", ":m .-2<CR>==", { desc = "Move line up" })
keymap({ "v" }, "p", '"_dP', { desc = "Paste" })

------------------------------- Visual Block -----------------------------------------
-- Move text up and down
keymap({ "x" }, "∆", ":move '>+1<CR>gv-gv", { desc = "Move Block down" })
keymap({ "x" }, "˚", ":move '<-2<CR>gv-gv", { desc = "Move Block up" })

-- Text Objects --
-- Line Operator
-- keymap("x", "il", ":<C-u>normal! g_v^<CR>", { desc = "Operate inside line" })
-- keymap("x", "al", ":<C-u>normal! $v0<CR>", { desc = "Operate around line" })
-- keymap("o", "il", ":<C-u>normal! g_v^<CR>", { desc = "Operate inside line" })
-- keymap("o", "al", ":<C-u>normal! $v0<CR>", { desc = "Operate around line" })

------------------------- Plugin Specific Mappings ---------------------------------
-- LSP
keymap({ "n" }, "<leader>li", "<Cmd>LspInfo<CR>", { desc = "Show LSP Info" })

-- Gitsigns (Map unused U to previewing hunk)
keymap({ "n" }, "<S-u>", "<Cmd>Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
