syntax on
"""""""" ---------------  Vim Plug (Plugin Manager) Setup ------------------
set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')

"""  List plugins here
Plug 'sheerun/vim-polyglot'						"Provides syntax for multiple filetypes
Plug 'airblade/vim-gitgutter'					"Show changes in file from previous commit
Plug 'tpope/vim-fugitive'						"Git integration plugin
Plug 'tpope/vim-commentary'						"Allows commenting lines/selection with gc
Plug 'tpope/vim-surround'						"Allows surrounding words/selection with cs
Plug 'tpope/vim-repeat'							"Allows repeating more previous commands with .
Plug 'tommcdo/vim-exchange'						"Allows exchanging words/selection with cx/X
Plug 'jiangmiao/auto-pairs'						"Automatically creates bracket pairs
Plug 'michaeljsmith/vim-indent-object'			"Autoindents lines
Plug 'machakann/vim-highlightedyank'			"Highlights yanks for short period
Plug 'ctrlpvim/ctrlp.vim'						"Fuzzy finding within vim with :Ctrlp
Plug 'vim-scripts/YankRing.vim'					"Stores multiples yanks
Plug 'simnalamburt/vim-mundo'					"Stores multiples undos
Plug 'scrooloose/nerdtree'						"Allows navigation of file tree
Plug 'aymericbeaumet/vim-symlink'				"Follows symlink rather than editing the symlink
Plug 'moll/vim-bbye'							"Better buffer management with :Bdelete etc.
Plug 'junegunn/goyo.vim'						"Distraction free vim
Plug 'vimwiki/vimwiki'							"Easy note taking and diary maintaining
Plug 'vim-pandoc/vim-pandoc'					"Pandoc support from within vim
Plug 'vim-pandoc/vim-pandoc-syntax'				"Pandoc syntax for relevant files

""" Theme plugins
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'drewtempelmeyer/palenight.vim'

""" Airline/Lightline/Bufferline plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
" Plug 'itchyny/lightline.vim'
" Plug 'shinchu/lightline-gruvbox.vim'
" Plug 'mengelbrecht/lightline-bufferline'

"""""""" ----------------- Plugin Settings ---------------
""" Ctrl-P
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
let g:ctrlp_working_path_mode = 'rw'
" let g:ctrlp_show_hidden = 1
" set runtimepath^=~/.vim/plug/ctrlp.vim

""" Highlight Yank
let g:yankring_history_file = '.yankring_history'
" let g:highlightedyank_highlight_duration = "200"

"""" Toggle AutoPairs
let g:AutoPairsShortcutToggle = '<leader>ap'

""" VimWiki
let g:vimwiki_list = [{'path': '/mnt/c/Users/soumi/Dropbox/Apps/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = '✗○◐●✓'
" autocmd FileType vimwiki setlocal shiftwidth=4 tabstop=4 noexpandtab

""" Goyo
let g:undotree_CustomUndotreeCmd = 'vertical 32 new'
let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
let g:goyo_width = 120
let g:goyo_linenr = 1

""" Gitgutter
let g:gitgutter_override_sign_column_highlight = 1
highlight! link SignColumn LineNr
autocmd ColorScheme * highlight! link SignColumn LineNr

""" Lightline
" let g:lightline = {
"       \ 'active': { 'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ] },
"       \ 'component_function': { 'gitbranch': 'fugitive#head' },
"       \ }
""" Bufferline
let g:bufferline_echo = 0
""" Airline
let g:airline_detect_modified=1
let g:airline_theme='dark'
let g:airline_stl_path_style = 'short'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#hunks#enabled = 0

""" Allow VIM to open urls with gx for WSL
let g:netrw_browsex_viewer="cmd.exe /c start"

""" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required

" Need to run ':PlugInstall' within vim whenever a plugin is added
" Need to run ':PlugUpdate' within vim to update a plugin

"""""""" ----------------- Global Settings ---------------
set autoindent
set autoread
set autowrite                   " allows changing buffer with save
set hidden
set clipboard=unnamedplus       " yank and paste with the system clipboard
set encoding=utf-8
set noexpandtab                 " tabs are spaces
set shiftround                  " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set shiftwidth=4
set smarttab                    " Insert “tabstop” number of spaces when the “tab” key is pressed.
set tabstop=4                   " number of visual spaces per TAB
set softtabstop=4               " number of spaces in tab when editing
set ignorecase                  " case-insensitive search
set smartcase
set incsearch                   " search as characters are entered
set hlsearch
set showmatch                   " highlight matching [{()}]
set noerrorbells
set number                      " show absolute line numbers
set relativenumber              " show relative line numbers (except current)
set ruler                       " show column in console
" set list                        " show trailing whitespace
set listchars=tab:▸\ ,trail:▫   "
set wrap                        " do not automatically wrap on load
set breakindent                 " enable indentation on linebreak
set linebreak                   " enable softwrap without breaking words
set textwidth=120               " text wraps at 120 instead of default 80
set scrolloff=4
set nobackup
set mouse=a
set undofile
set undodir=~/.vim/undo
set updatetime=1000             " Sets time between git diff run by gitgutter
set backspace=indent,eol,start  " Vim 8.2 update had changed default backspace behaviour. This reverts it.
set noro                        " Set no read only mode. Useful when using git difftool.
set showcmd                     " shows the current command
set laststatus=2                " 2 - Always display the status bar.
set termguicolors               " Set true color (use only when terminal supports true colors)
set background=dark             " For colorscheme

""""""""" ---------------  VIM Cursor --------------------
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

if &term =~ '^xterm'
    " normal mode
    let &t_EI .= "\<Esc>[2 q"
    " insert mode
    let &t_SI .= "\<Esc>[6 q"
    " replace mode
    let &t_SR.="\<Esc>[3 q"
endif


""""""""" ---------------  VIM Themes --------------------
" ---- Solarized Dark
colorscheme solarized
let g:lightline = { 'colorscheme': 'solarized' }
highlight! link SignColumn LineNr
autocmd ColorScheme * highlight! link SignColumn LineNr

" ---- Solarized Dark True Color
" autocmd vimenter * ++nested colorscheme solarized8_flat
" let g:solarized_extra_hi_groups = 1
" highlight! link SignColumn LineNr
" autocmd ColorScheme * highlight! link SignColumn LineNr
" let g:airline_theme= 'solarized'
" let g:airline_solarized_bg='dark'
" let g:lightline.colorscheme = 'solarized'

" ---- Palenight
" colorscheme palenight
" let g:palenight_terminal_italics=1
" let g:lightline.colorscheme = 'palenight'
" let g:airline_theme= 'palenight'

" ---- Gruvbox
let g:gruvbox_italic=1
colorscheme gruvbox
let g:airline_theme= 'gruvbox'
" let g:lightline.colorscheme = 'gruvbox'

""""""""" --------------- Goyo settings ----------------------
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

""""""""" --------------- VIM Buffer ----------------------
"make vim save and load the folding of the document each time it loads"
"also places the cursor in the last place that it was left."
autocmd BufWinLeave ?* mkview 1
autocmd BufWinEnter ?* silent loadview 1

"""""""" ---------------- VIM Finding Files ------------------
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.a,*.bmp,*.png,*.tiff,*.jpg,*.eps,*.gif,*.ico
set wildignore+=*.pdf,*.doc,*.xlsx,*.dmg,*.zip,*.app,*.mp4,*.mkv,*.ogg,*.mp3
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*.swp,*.tmp.
" - :b lets you autocomplete any open buffer

"""""""" --------------- leader Mappings ------------------------
" leader is now set to Spacebar
let mapleader = " "
" localleader is now set to comma
let localleader = ","

" Switch between the last two files
nnoremap <leader><leader> :w<CR><C-^>

" Open and source ideavimrc
nnoremap <leader>ei :w<CR> :e ~/.ideavimrc <CR>
nnoremap <leader>si :w<CR> :source ~/.ideavimrc <CR> :echo "Sourced ideavimrc" <CR>
" Open and source zshrc
nnoremap <leader>ez :w<CR> :e ~/.zshrc <CR>
nnoremap <leader>sz :w<CR> :source ~/.zshrc <CR> :echo "Sourced zshrc" <CR>
" Open zsh aliases
nnoremap <leader>ea :w<CR> :e ~/.oh-my-zsh/custom/aliases.zsh <CR>
" Open and source vimrc
nnoremap <leader>ev :w<CR> :e ~/.vimrc <CR>
nnoremap <leader>sv :w<CR> :source ~/.vimrc <CR> :echo "Sourced vimrc" <CR>
" Open and source bashrc
nnoremap <leader>eb :w<CR> :e ~/.bashrc <CR>
nnoremap <leader>sb :w<CR> :source ~/.bashrc <CR> :echo "Sourced bashrc" <CR>
" Open and source tmux conf
nnoremap <leader>et :w<CR> :e ~/.tmux.conf <CR>

" Manage Plugins
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>

" Fuzzy searching with CtrlP
nnoremap <silent> <leader>pp :CtrlP<CR>
nnoremap <silent> <leader>ph :CtrlP ~<CR>
nnoremap <silent> <leader>pd :CtrlP ~/.dotfiles/<CR>
nnoremap <leader>pb :CtrlPBuffer<cr>
nnoremap <leader>pt :CtrlPTag<cr>
nnoremap <leader>m :CtrlPMRU<cr>

" Quickly insert an empty new line without entering insert mode
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>j

" Removes highlighting until next search
nnoremap <leader>hl :noh<CR>

" Nerdtree toggle
nnoremap <leader>nn :NERDTreeToggle<CR>

" Removes highlighting until next search
nnoremap <leader>nu :set number!<CR> :set relativenumber!<CR>

" Show undo tree
nnoremap <leader>uu :MundoToggle<CR>

" Column mode selection
nnoremap <leader>vv <C-v>

" Diff mode
nnoremap <leader>df :vert diffsplit 
nnoremap <leader>ds :windo diffthis<CR>

" Show yank buffer
nnoremap <leader>yy :YRShow<CR>

" Goyo mappings
nnoremap <leader>go :Goyo<CR>

" Git Fugitive mappings
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log<CR>

" Go to specific buffer
nnoremap <leader>hh  :w<CR>:bp<CR>
nnoremap <leader>ll  :w<CR>:bn<CR>

" Go to next or previous window
nnoremap <leader>kj  <C-w>h
nnoremap <leader>jk  <C-w>l
nnoremap <leader>jj  <C-w>j
nnoremap <leader>kk  <C-w>k
" nnoremap <leader>[  :w<CR><C-w>h
" nnoremap <leader>]  :w<CR><C-w>l
" nnoremap <leader>jj  :w<CR><C-w>j
" nnoremap <leader>kk  :w<CR><C-w>k

"Save or Close current buffer(s)
nnoremap <leader>aa :w<CR>:Bdelete<CR>
nnoremap <leader>rr :wq<CR>
nnoremap <leader>ee :w<CR><Esc>
nnoremap <leader>re :q<CR>
nnoremap <leader>er :wqa<CR>

"Quit current buffer without saving
nnoremap <leader>qq :q!<CR>

"""""""" --------------- Mappings ------------------------
" Pressing j or k twice in insert mode will lead to Esc
inoremap jj <Esc>
inoremap kk <Esc>
inoremap jk <Esc>
inoremap JJ <Esc>
inoremap ZZ <Esc> :wq<CR>

" Get off my lawn (Never use arrow keys)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
" inoremap <Left> <NOP>
" inoremap <Right> <NOP>
" inoremap <Up> <NOP>
" inoremap <Down> <NOP>
" inoremap <Esc> <NOP>

" Allows easy copying to end of line
nnoremap Y y$

" Keeps stuff centered when searching in file
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Helps move entire block in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Helps move line in insert mode
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
" Helps move line in normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

""""""" _______________ Abbreviations ___________________
" iabbrev @@ soumilgurjar@gmail.com
