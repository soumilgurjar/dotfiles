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
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-bufferline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Need to run ':PluginInstall' within vim whenever a plugin is added

"""""""" ----------------- Global Settings ---------------
set autoindent
set autoread
set autowrite                   " allows changing buffer with save
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
set laststatus=1                " Always display the status bar.
set cursorline
set mouse=a

""""""""" ---------------  VIM Themes --------------------
" ---- Solarized Dark
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

" ---- Palenight
set background=dark
let g:lightline = { 'colorscheme': 'palenight' }
colorscheme palenight

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

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
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" - :b lets you autocomplete any open buffer

"""""""" --------------- Mappings ------------------------
" Leader is now set to Spacebar
let mapleader = " "

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>
" Pressing j twice in insert mode will lead to Esc
imap jj <Esc>

" Get off my lawn (Never use arrow keys)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
" Removes highlighting until next search asdadas
nnoremap <Leader>hl :noh<CR>
" Allows easy copying to end of line
nnoremap Y y$
" Keeps stuff centered when searching in file
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

""""""" _______________ Abbreviations ___________________
" iabbrev @@ soumilgurjar@gmail.com
