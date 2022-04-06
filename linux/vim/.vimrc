syntax on
"""""""" ---------------  Vim Plug (Plugin Manager) Setup ------------------
set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')

"""  List plugins here
Plug 'sheerun/vim-polyglot'						"Provides syntax for multiple filetypes
Plug 'airblade/vim-gitgutter'					"Show changes in file from previous commit
Plug 'tpope/vim-fugitive'						"Git integration plugin
Plug 'justinmk/vim-sneak'						"Better search with 2,3 starting letters with s/S, operators with z/Z
Plug 'easymotion/vim-easymotion'				"New way of moving within vim
Plug 'tpope/vim-commentary'						"Allows commenting lines/selection with gc
Plug 'tpope/vim-surround'						"Allows surrounding words/selection with cs
Plug 'tpope/vim-repeat'							"Allows repeating more previous commands with .
Plug 'tommcdo/vim-exchange'						"Allows exchanging words/selection with cx/X
Plug 'tpope/vim-endwise'						"Automatically ends functions like if etc.
Plug 'tpope/vim-abolish'						"Better robust substition and easier case changing
Plug 'Raimondi/delimitMate'						"Automatically creates bracket pairs
Plug 'michaeljsmith/vim-indent-object'			"Autoindents lines
Plug 'machakann/vim-highlightedyank'			"Highlights yanks for short period
Plug 'SirVer/ultisnips'							"Track the snippet engine
Plug 'honza/vim-snippets'						"Snippets are separated from the engine 
Plug 'ycm-core/YouCompleteMe'					"Autocompletion
Plug 'ctrlpvim/ctrlp.vim'						"Fuzzy finding within vim with :Ctrlp
Plug 'vim-scripts/YankRing.vim'					"Stores multiples yanks
Plug 'simnalamburt/vim-mundo'					"Stores multiples undos
Plug 'scrooloose/nerdtree'						"Allows navigation of file tree
Plug 'aymericbeaumet/vim-symlink'				"Follows symlink rather than editing the symlink
Plug 'moll/vim-bbye'							"Better buffer management with :Bdelete etc.
Plug 'junegunn/goyo.vim'						"Distraction free vim
Plug 'vimwiki/vimwiki'							"Easy note taking and diary maintaining
Plug 'lervag/vimtex'							"Latex syntax plugin that provides viewing with zathura
Plug 'vim-pandoc/vim-pandoc'					"Pandoc support from within vim
Plug 'vim-pandoc/vim-pandoc-syntax'				"Pandoc syntax for relevant files
Plug 'kbarrette/mediummode'						"Disable common vim navigation functions to help learn vim faster

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
""" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" set completeopt-=preview
" let g:ycm_show_diagnostics_ui = 0
let g:ycm_language_server =
  \ [{
  \   'name': 'ccls',
  \   'cmdline': [ 'ccls' ],
  \   'filetypes': [ 'c', 'cpp', 'cc', 'h', 'hpp', 'cuda' ],
  \   'project_root_files': [ '.ccls-root', 'compile_commands.json' ]
  \ }]
let s:lsp_ft_maps = 'gdscript,go,python' "Change filetypes to show hover info with K or go to declaration with gd
augroup ycm_settings | au!
    exe printf('au FileType %s call Ycm_mappings()', s:lsp_ft_maps)
augroup end
func! Ycm_mappings() abort
    nmap <silent><buffer> <F3> <plug>(YCMHover)
    nnoremap <silent><buffer> <F4> :YcmCompleter GoTo<CR>
endfunc

""" Ctrl-P
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
let g:ctrlp_working_path_mode = 'rw'
" let g:ctrlp_show_hidden = 1
" set runtimepath^=~/.vim/plug/ctrlp.vim

" Ultisnips (do not use tab as it may conflict with autocompletion engine)
let g:UltiSnipsExpandTrigger = "<C-s>"
let g:UltiSnipsListSnippets = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-b>"
let g:UltiSnipsJumpBackwardTrigger = "<C-z>"
let g:UltiSnipsEditSplit = "vertical"

""" Highlight Yank
let g:yankring_history_file = '.yankring_history'
" let g:highlightedyank_highlight_duration = "200"

""" Toggle AutoPairs
let g:AutoPairsShortcutToggle = '<leader>ap'

""" Mediummode
let g:mediummode_enabled = 1
let g:mediummode_allowed_motions = 4

""" VimWiki
let g:vimwiki_list = [{'path': '/mnt/c/Users/soumi/Dropbox/Apps/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = '✗○◐●✓'
" autocmd FileType vimwiki setlocal shiftwidth=4 tabstop=4 noexpandtab

""" Vimtex
let g:vimtex_view_method = 'zathura'
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

""" Sneak
let g:sneak#label = 1			"Show labels for easy motion
let g:sneak#use_ic_scs = 1		"Search is case smart

""" EasyMotion
let g:EasyMotion_keys = 'jkdslaeiruvmcghwoxtybnzqp;slf' "default : 'asdghklqwertyuiopzxcvbnmfj;'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " Turn on case-insensitive feature
let g:EasyMotion_use_smartsign_us = 1 " Similar case insensitive for symbol for US keyboards
let g:EasyMotion_startofline = 1 "Move cursor to start line with line motions
let g:EasyMotion_space_jump_first = 1

""" Goyo
let g:undotree_CustomUndotreeCmd = 'vertical 32 new'
let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
let g:goyo_width = 120
let g:goyo_height = '100%'
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
set shortmess=a					" Abbreviates file messages to prevent hit enter to continue message
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
    " replace mode (is causing a weird cursor refresh every 5 sec)
    " let &t_SR .="\<Esc>[4 q"
endif

""""""""" ---------------  WSL yank support --------------------
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

""""""""" ---------------  VIM Themes --------------------

" ---- Solarized Dark True Color
" autocmd vimenter * ++nested colorscheme solarized8_flat
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

"""""""" --------------- Python Highlighting------------------------
autocmd BufRead,BufNewFile *.py let python_highlight_all=1

"""""""" --------------- leader Mappings ------------------------
" leader is now set to Spacebar
let mapleader = " "
" localleader is now set to comma
" let localleader = ","

" Switch between the last two files
nnoremap <leader><leader> :w<CR><C-^>

" Open and source ideavimrc
nnoremap <leader>ei :w<CR> :e ~/.dotfiles/windows/ideavim/.ideavimrc <CR>
nnoremap <leader>si :w<CR> :source ~/.dotfiles/windows/ideavim/.ideavimrc <CR> :echo "Sourced ideavimrc" <CR>
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

" Removes highlighting until next search
nnoremap <leader>he :vert bo h 
" Medium mode enable and disable
nnoremap <leader>hm :MediumModeToggle<CR>

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
nnoremap <leader>gy :Goyo 120x100%<CR>

" Git Fugitive mappings
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log<CR>

" Go to specific buffer
nnoremap <leader>hh :w<CR>:bp<CR>
nnoremap <leader>ll :w<CR>:bn<CR>
" nnoremap <leader>hl <C-a><Right>
" nnoremap <leader>lh <C-a><Left>

" Go to next or previous window
nnoremap <leader>kj  <C-w>h
nnoremap <leader>jk  <C-w>l
nnoremap <leader>jj  <C-w>j
nnoremap <leader>kk  <C-w>k

"Save or Close current buffer(s)
nnoremap <leader>aa :w<CR>:Bdelete<CR>
nnoremap <leader>rr :wq<CR>
nnoremap <leader>ee :w<CR><Esc>
nnoremap <leader>re :q<CR>
nnoremap <leader>er :wqa<CR>
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

" Map Sneak backward moving key to \
" map \ <Plug>Sneak_,

" Easymotion - `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-s2)
map  f <Plug>(easymotion-fl)
map  F <Plug>(easymotion-tl)
map  t <Plug>(easymotion-Fl)
map  T <Plug>(easymotion-Tl)
" JK motions: Line motions
map ; <Plug>(easymotion-k)
map , <Plug>(easymotion-j)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
""""""" _______________ Abbreviations ___________________
" iabbrev @@ soumilgurjar@gmail.com
