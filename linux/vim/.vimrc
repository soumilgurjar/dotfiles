syntax on
"""""""" ---------------  Vundle Setup ------------------
set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" List plugins here
Plug 'VundleVim/Vundle.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-bufferline'
Plug 'simnalamburt/vim-mundo'
Plug 'vim-scripts/YankRing.vim'
Plug 'kien/ctrlp.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'machakann/vim-highlightedyank'
Plug 'tommcdo/vim-exchange'
Plug 'airblade/vim-gitgutter'
Plug 'aymericbeaumet/vim-symlink'
Plug 'moll/vim-bbye'

" Theme plugins
Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'gosukiwi/vim-atom-dark'

" Plugin settings
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
let g:yankring_history_file = '.yankring_history'
" let g:highlightedyank_highlight_duration = "200"

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required

" Need to run ':PlugInstall' within vim whenever a plugin is added
" Need to run ':PlugUpdate' within vim to update a plugin

"""""""" ----------------- Global Settings ---------------
set autoindent
set autoread
set autowrite                   " allows changing buffer with save
set hidden
set clipboard=unnamed           " yank and paste with the system clipboard
set encoding=utf-8
set expandtab                   " tabs are spaces
set shiftround                  " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set shiftwidth=4
set smarttab                    " Insert “tabstop” number of spaces when the “tab” key is pressed.
set tabstop=4                   " number of visual spaces per TAB
set softtabstop=4               " number of spaces in tab when editing
set ignorecase                  " case-insensitive search
set incsearch                   " search as characters are entered
set hlsearch
set showmatch                   " highlight matching [{()}]
set noerrorbells
set number                      " show absolute line numbers
set relativenumber              " show relative line numbers (except current)
set ruler                       " show column in console
set list                        " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set showcmd                     " shows the current command
set nowrap                      " do not automatically wrap on load
set textwidth=120               " text wraps at 120 instead of default 80
set scrolloff=10
set smartcase
set nobackup
set laststatus=2                " Always display the status bar.
set mouse=a
set undofile
set undodir=~/.vim/undo
set updatetime=1000             " Sets time between git diff run by gitgutter
set backspace=indent,eol,start  " Vim 8.2 update had changed default backspace behaviour. This reverts it.

""""""""" ---------------  VIM Cursor --------------------
" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
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
" let g:solarized_termcolors=256
" set t_Co=256
" set background=dark
" colorscheme solarized
" let g:lightline = { 'colorscheme': 'solarized' }
" highlight! link SignColumn LineNr
" autocmd ColorScheme * highlight! link SignColumn LineNr

" ---- Solarized Light
" set background=light
" colorscheme solarized
" let g:lightline = { 'colorscheme': 'solarized' }

" ---- Atom Dark
" set background=dark
" colorscheme atom-dark
" let g:lightline = { 'colorscheme': 'atom-dark' }

" ---- Palenight
set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }
let g:palenight_terminal_italics=1

let g:lightline = {
      \ 'active': { 'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ] },
      \ 'component_function': { 'gitbranch': 'fugitive#head' },
      \ }


""""""""" --------------- VIM Buffer ----------------------
"make vim save and load the folding of the document each time it loads"
"also places the cursor in the last place that it was left."
au BufWinLeave ?* mkview 1
au BufWinEnter ?* silent loadview 1

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

" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" - :b lets you autocomplete any open buffer

"""""""" --------------- leader Mappings ------------------------
" leader is now set to Spacebar
let mapleader = " "

" Open and source ideavimrc
nnoremap <leader>ei :w<CR> :e ~/.dotfiles/windows/ideavim/.ideavimrc <CR>
nnoremap <leader>si :w<CR> :source ~/.dotfiles/windows/ideavim/.ideavimrc <CR> :echo "Sourced ideavimrc" <CR>
" Open and source zshrc
nnoremap <leader>ez :w<CR> :e ~/.zshrc <CR>
nnoremap <leader>sz :w<CR> :source ~/.zshrc <CR> :echo "Sourced zshrc" <CR>
" Open and source vimrc
nnoremap <leader>ev :w<CR> :e ~/.vimrc <CR>
nnoremap <leader>sv :w<CR> :source ~/.vimrc <CR> :echo "Sourced vimrc" <CR>
"Open and source bashrc
nnoremap <leader>eb :w<CR> :e ~/.bashrc <CR>
nnoremap <leader>sb :w<CR> :source ~/.bashrc <CR> :echo "Sourced bashrc" <CR>

" Install Plugins
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>

" Quickly insert an empty new line without entering insert mode
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

" Removes highlighting until next search
nnoremap <leader>hl :noh<CR>

" Switch between the last two files
nnoremap <leader><leader> :w<CR><C-^>

" Show undo tree
nnoremap <leader>u :MundoToggle<CR>

" Show yank buffer
nnoremap <leader>y :YRShow<CR>

" Nerdtree toggle
nnoremap <leader>n :NERDTreeToggle<CR>

" CtrlP toggle
nnoremap <silent> <leader>p :w<CR>:CtrlP<CR>

" Git Fugitive mappings
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gph :Git push<CR>
nnoremap <leader>gpl :Git pull<CR>
nnoremap <leader>gl :Git log<CR>

" Go to specific buffer
nnoremap <leader>hh  :w<CR>:bp<CR>
nnoremap <leader>ll  :w<CR>:bn<CR>
nnoremap <leader>1  :w<CR>:1b<CR>
nnoremap <leader>2  :w<CR>:2b<CR>
nnoremap <leader>3  :w<CR>:3b<CR>
nnoremap <leader>4  :w<CR>:4b<CR>
nnoremap <leader>5  :w<CR>:5b<CR>

" Go to next or previous window
nnoremap <leader>[  :w<CR><C-w>h
nnoremap <leader>]  :w<CR><C-w>l

"Close current buffer
nnoremap <leader>qq :w<CR>:Bdelete<CR>

"Save current buffer
nnoremap <leader>ww :w<CR><Esc>

"Quit current buffer without saving
nnoremap <leader>a :q<CR>

"""""""" --------------- Mappings ------------------------
" Pressing j twice in insert mode will lead to Esc
inoremap jj <Esc>

" Get off my lawn (Never use arrow keys)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Esc> <NOP>

" Allows easy copying to end of line
nnoremap Y y$

" Keeps stuff centered when searching in file
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Helps move entire block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Helps move line in insert mode
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

""""""" _______________ Abbreviations ___________________
" iabbrev @@ soumilgurjar@gmail.com
