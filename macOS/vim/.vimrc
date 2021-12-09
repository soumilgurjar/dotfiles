syntax on
"""""""" ---------------  Vundle Setup ------------------
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-bufferline'
Plugin 'simnalamburt/vim-mundo'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'kien/ctrlp.vim'

" Theme plugins
Plugin 'itchyny/lightline.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'gosukiwi/vim-atom-dark'

" Plugin settings
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
let g:yankring_history_file = '.yankring_history'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Need to run ':PluginInstall' within vim whenever a plugin is added

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
set scrolloff=10
set smartcase
set nobackup
set laststatus=2                " Always display the status bar.
set cursorline
set mouse=a
set undofile
set undodir=~/.vim/undo

""""""""" ---------------  VIM Themes --------------------
" ---- Solarized Dark
set background=dark
colorscheme solarized
let g:lightline = { 'colorscheme': 'solarized' }

" ---- Solarized Light
" set background=light
" colorscheme solarized
" let g:lightline = { 'colorscheme': 'solarized' }

" ---- Atom Dark
" set background=dark
" colorscheme atom-dark
" let g:lightline = { 'colorscheme': 'atom-dark' }

" ---- Palenight
" set background=dark
" colorscheme palenight
" let g:lightline = { 'colorscheme': 'palenight' }
" let g:palenight_terminal_italics=1

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
nnoremap <leader>ei :w<CR> :e ~/.ideavimrc <CR>
nnoremap <leader>si :w<CR> :source ~/.ideavimrc <CR> :echo "Sourced ideavimrc" <CR>
" Open and source zshrc
nnoremap <leader>ez :w<CR> :e ~/.zshrc <CR>
nnoremap <leader>sz :w<CR> :source ~/.zshrc <CR> :echo "Sourced zshrc" <CR>
" Open and source vimrc
nnoremap <leader>ev :w<CR> :e ~/.vimrc <CR>
nnoremap <leader>sv :w<CR> :source ~/.vimrc <CR> :echo "Sourced vimrc" <CR>
"Open and source bashrc
nnoremap <leader>eb :w<CR> :e ~/.bashrc<CR>
nnoremap <leader>sb :w<CR> :source ~/.bashrc<CR> :echo "Sourced bashrc" <CR>

" Install Plugins
nnoremap <leader>pi :PluginInstall<CR>

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

" Git mappings
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gph :Gpush<CR>
nnoremap <leader>gpl :Gpull<CR>

" Go to specific buffer
nnoremap <leader>1  :w<CR>:1b<CR>
nnoremap <leader>2  :w<CR>:2b<CR>
nnoremap <leader>3  :w<CR>:3b<CR>
nnoremap <leader>4  :w<CR>:4b<CR>
nnoremap <leader>5  :w<CR>:5b<CR>

" Move lines up or down
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

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
