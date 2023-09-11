-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Remap space as leader key
vim.g.mapleader = " "
-- Remap backspace as localleader key
vim.g.maplocalleader = vim.api.nvim_replace_termcodes("<BS>", false, false, true)

-- stylua: ignore start
vim.opt.backup = false                          -- creates a backup file
vim.opt.breakindent = true                      -- wrapped line will continue visually indented
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menu" ,"menuone", "preview", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 2                        -- so that `` is visible in markdown files
vim.opt.concealcursor = ""                      -- set modes in which text in cursor line can also be concealed
vim.opt.cursorline = false                      -- highlight the current line
vim.opt.diffopt:append("vertical,algorithm:histogram") -- highlight the current line
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.fillchars="fold: "
vim.opt.formatoptions:remove("cro")             -- influence how vim formats text: no continued comments
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.iskeyword:append("-")                   -- treats words with `-` as single words
vim.opt.laststatus = 3                          -- Global statusline instead of per window
vim.opt.linebreak = true                        -- Don't break line in the middle of a word
vim.opt.list = true                             -- list mode to mark special characters
vim.opt.listchars = 'tab:› ,extends:»,precedes:‹,nbsp:·,trail:·'    -- mark <Tab> as >-, trailing <Space> as .
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.number = true                           -- set numbered lines
vim.opt.numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
vim.opt.pumheight = 20                          -- pop up menu height
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.scrolloff = 0                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
-- vim.opt.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- xxx completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.spelllang="en_gb,de_ch"                 -- Set spell language to English and German
vim.opt.spelloptions = "camel"                  -- Spell check with Camel format
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = true                         -- creates a swapfile
vim.opt.tabstop = 4                             -- insert 4 spaces for a tab
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 300                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.wildignorecase = true                   -- Don't care about case when completing filenames
vim.opt.wildmode = "list:longest"               -- Complete longest common string, then list alternatives.
vim.opt.whichwrap:append("<,>,[,]")             -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.wrap = true                            -- display lines as one long line
-- vim.opt.wrapmargin = 2                          -- Wrap margin from right edge of window
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.g.python3_host_prog = "/Users/soumilgurjar/.local/share/virtualenvs/pynvim-SoAlyl0U/bin/python" -- Python3 executable for neovim within a pipenv virtualenv
-- stylua: ignore end
