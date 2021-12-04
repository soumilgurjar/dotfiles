syntax on
set showmatch                 " highlight matching [{()}]
set incsearch                 " search as characters are entered
set hlsearch                  " highlight matches

set tabstop=4                 " number of visual spaces per TAB
set softtabstop=4             " number of spaces in tab when editing
set shiftwidth=4
set expandtab                 " tabs are spaces
set number                    " show absolute line numbers
set relativenumber            " show relative line numbers (except current)
set ruler                     " show column in console
filetype indent on            " load filetype-specific indent files
set autoindent

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

"Need to run ':PluginInstall' within vim whenever a new plugin is added

""""""""" ---------------  VIM Themes --------------------
" ---- Solarized Dark
" set background=dark
" let g:solarized_termcolors=256
" colorscheme default

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

" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" - :b lets you autocomplete any open buffer

"""""""" ----------------  SNIPPETS -----------------------

" Read an empty HTML template and move cursor to title
"nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
nnoremap ,svrc :source $MYVIMRC<CR>

"""""""" --------------- Mappings ------------------------
map <C-n> :NERDTreeToggle<CR>
imap jj <Esc>
