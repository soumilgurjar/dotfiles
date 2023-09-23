syntax on

"""""""" ---------------  Vim Plug (Plugin Manager) Setup ------------------
set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')

"""  List plugins here
Plug 'Raimondi/delimitMate'                     "Automatically creates bracket pairs
Plug 'airblade/vim-gitgutter'                   "Show changes in file from previous commit
Plug 'airblade/vim-rooter'                      "Autochanges current directory to project root when found; Helpful for fzf
Plug 'christoomey/vim-sort-motion'              "Easy sorting of lines with gs command
Plug 'easymotion/vim-easymotion'                "New way of moving within vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                         "Fuzzy finding within vim with :Files
Plug 'machakann/vim-highlightedyank'            "Highlights yanks for short period
Plug 'michaeljsmith/vim-indent-object'          "Provide text objects ai,ii,aI,iI to operate on indent
Plug 'moll/vim-bbye'                            "Better buffer management with :Bdelete, :Bwipeout etc.
Plug 'pbogut/fzf-mru.vim'                       "Bring Most Recently Used Functionality to FZF
Plug 'preservim/nerdtree'                      "Allows navigation of file tree
Plug 'romainl/vim-cool'                         "Better search highlighting which disappears after moving away from search
Plug 'sheerun/vim-polyglot'                     "Provides syntax for multiple filetypes
Plug 'simnalamburt/vim-mundo'                   "Stores multiples undos
Plug 'svermeulen/vim-subversive'                "Easier substitution of text object with register
Plug 'tommcdo/vim-exchange'                     "Allows exchanging words/selection with cx/X
Plug 'tpope/vim-abolish'                        "Better robust substition and easier case changing
Plug 'tpope/vim-commentary'                     "Allows commenting lines/selection with gc
Plug 'tpope/vim-fugitive'                       "Git integration plugin
Plug 'tpope/vim-repeat'                         "Allows repeating more previous commands with .
Plug 'tpope/vim-surround'                       "Allows surrounding words/selection with cs
Plug 'tpope/vim-unimpaired'                     "Complementary pair of mappings for quickfix, line addition, toggle settings etc.
Plug 'vim-scripts/YankRing.vim'                 "Stores multiples yanks
Plug 'wellle/targets.vim'                       "Provides more operators than standard vim e.g v2il'

""" Theme plugins
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

""" Airline/Lightline/Bufferline plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

"""""""" ----------------- Plugin Settings ---------------
""" fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9} }
" This command changes the default :Rg command to work with hidden files
command! -bang -nargs=* Rg call fzf#vim#grep("rg --hidden --follow --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

""" vim-rooter
let g:rooter_patterns = ['.vimroot', '.git/', '.python-version', 'Makefile', '*.sln']
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_resolve_links = 1
" let g:rooter_silent_chdir = 1

""" Highlight Yank
let g:yankring_history_file = '.yankring_history'
" let g:highlightedyank_highlight_duration = "200"
let g:yankring_zap_keys = ''                "Helps prevent yankring for hijacking y/c/d

""" EasyMotion
let g:EasyMotion_keys = 'jkdslaeiruvmcghwoxtybnzqp;slf' "default : 'asdghklqwertyuiopzxcvbnmfj;'
let g:EasyMotion_do_mapping = 0 " Enable/Disable default mappings
let g:EasyMotion_smartcase = 1 " Turn on case-insensitive feature
let g:EasyMotion_use_smartsign_us = 1 " Similar case insensitive for symbol for US keyboards
let g:EasyMotion_startofline = 1 "Move cursor to start line with line motions
let g:EasyMotion_space_jump_first = 1

""" Vimcool
let g:CoolTotalMatches = 1

""" Gitgutter
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_close_preview_on_escape = 1
highlight! link SignColumn LineNr
autocmd ColorScheme * highlight! link SignColumn LineNr

""" Bufferline
let g:bufferline_echo = 0

""" Airline
" let g:airline_disable_statusline = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_stl_path_style = 'short'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#hunks#enabled = 0
let g:airline_detect_spelllang=1
let g:airline_section_y = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline_symbols.maxlinenr= ''
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = '$'

""" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required

" Need to run ':PlugInstall' within vim whenever a plugin is added
" Need to run ':PlugUpdate' within vim to update a plugin

"""""""" ----------------- Global Settings ---------------
set autoindent
set autoread
set autowrite                   " allows changing buffer with save
set background=dark             " For colorscheme
set backspace=indent,eol,start  " Vim 8.2 update had changed default backspace behaviour. This reverts it.
set breakindent                 " enable indentation on linebreak
set clipboard=unnamedplus       " yank and paste with the system clipboard
set encoding=utf-8
set expandtab                   " tabs are spaces
set hidden
set hlsearch
set ignorecase                  " case-insensitive search
set incsearch                   " search as characters are entered
set laststatus=2                " 2 - Always display the status bar.
set linebreak                   " enable softwrap without breaking words
set list                        " show trailing whitespace
set listchars=tab:›\ ,extends:»,precedes:‹,nbsp:·,trail:·   " list of characters to show
set mouse=a
set nobackup
set noerrorbells
set noro                        " Set no read only mode. Useful when using git difftool.
set noshowmode                    " stop showing current mode
set nrformats+=alpha
set number                      " show absolute line numbers
set relativenumber              " show relative line numbers (except current)
set ruler                       " show column in console
set scrolloff=4
set shiftround                  " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set shiftwidth=4
set shortmess=a                 " Abbreviates file messages to prevent hit enter to continue message
set showcmd                     " shows the current command
set showmatch                   " highlight matching [{()}]
set sidescrolloff=8
set smartcase
set smartindent
set smarttab                    " Insert “tabstop” number of spaces when the “tab” key is pressed.
set softtabstop=4               " number of spaces in tab when editing
set spelllang="en_gb,de_ch"
set spelloptions="camel"
set splitright
set tabstop=4                   " number of visual spaces per TAB
set termguicolors               " Set true color (use only when terminal supports true colors)
set textwidth=0                 " No hard wrap of text; default 80
set undodir=~/.vim/undo
set undofile
set updatetime=300             " Sets time between git diff run by gitgutter
set wrap                        " automatically wrap on load
set wrapscan                    " Allow search to wrap to start of file
if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

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

""""""""" ---------------  VIM Themes --------------------
" ---- Catppuccin
colorscheme catppuccin_macchiato
let g:airline_theme= 'catppuccin_macchiato'

""""""""" --------------- VIM Buffer ----------------------
"make vim save and load the folding of the document each time it loads"
"also places the cursor in the last place that it was left."
autocmd BufWinLeave ?* mkview 1
autocmd BufWinEnter ?* silent loadview 1

" Sets current directory to the directory of file in current window

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

"""""""" --------------- FZF actions ------------------------
" " Might need to change rtp below
" set rtp+=/usr/local/opt/fzf
function! s:insert_file_path(lines)
    let @@ = fnamemodify(a:lines[0], ":p")
    normal! p
endfunction
function! s:insert_relative_file_path(lines)
    let @@ = fnamemodify(a:lines[0], ":f")
    normal! p
endfunction
let g:fzf_action = {
            \ 'ctrl-r': function('s:insert_relative_file_path'),
            \ 'ctrl-e': function('s:insert_file_path') }

"""""""" --------------- File Specific Autocommands ------------------------
autocmd BufRead,BufNewFile *.py let python_highlight_all=1
" autocmd FileType vim setlocal shiftwidth=4 tabstop=4 expandtab
" autocmd FileType tex setlocal shiftwidth=4 tabstop=4 expandtab
autocmd BufRead,BufNewFile *.gitconfig-* set filetype=gitconfig

augroup vim-help-right-split
    autocmd!
    autocmd FileType help wincmd L
augroup END

augroup vimrc-tex
    autocmd!
    autocmd FileType tex nnoremap j gj
    autocmd FileType tex vnoremap j gj
    autocmd FileType tex nnoremap k gk
    autocmd FileType tex vnoremap k gk
augroup END

augroup markdown-txt-Spell
    autocmd!
    autocmd FileType markdown,vimwiki,text setlocal spell
    autocmd FileType markdown,vimwiki,text setlocal spelllang=en_gb
    autocmd FileType markdown,vimwiki,text highlight SpellBad cterm=underline
    autocmd BufRead,BufNewFile *.md,*.txt,*.rst setlocal spell
    autocmd BufRead,BufNewFile *.md,*.txt,*.rst setlocal spelllang=en_gb
    autocmd BufRead,BufNewFile *.md,*.txt,*.rst highlight SpellBad cterm=underline
augroup END

"""""""" --------------- leader Mappings ------------------------
" leader is now set to Spacebar
let mapleader = " "
" localleader is now set to Backspace
let maplocalleader = "\<BS>"

" Switch between the last two files
nnoremap <silent> <leader><leader> <C-^>

" Open and source vimrc
nnoremap <leader>ev :w<CR> :edit ~/.vimrc <CR>
nnoremap <leader>sv :w<CR> :source ~/.vimrc <CR> :echo "Sourced vimrc" <CR>
" Open and source bashrc
nnoremap <leader>eb :w<CR> :edit ~/.bashrc <CR>
nnoremap <leader>sb :w<CR> :source ~/.bashrc <CR> :echo "Sourced bashrc" <CR>
" Open and source tmux conf
nnoremap <leader>et :w<CR> :edit ~/.tmux.conf <CR>

" Manage Plugins
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>

" Fuzzy searching with fzf
nnoremap <silent> <leader><leader> :FZFMru<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :GFiles<CR>
nnoremap <silent> <leader>fb :BCommits<CR>
nnoremap <silent> <leader>fc :Commits<CR>
nnoremap <silent> <leader>fu :Buffers<CR>
nnoremap <silent> <leader>ft :Tags<CR>
nnoremap <silent> <leader>ftb :BTags<CR>
nnoremap <silent> <leader>fh :Files ~<CR>
nnoremap <silent> <leader>fd :Files ~/Git_Repositories/dotfiles<CR>
nnoremap <silent> <leader>/ :Lines<CR>
nnoremap <silent> <leader>' :Marks<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Git Fugitive mappings
nnoremap <silent> <leader>gg :Git<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gcm :Git commit<CR>
nnoremap <silent> <leader>gcl :0Gclog<CR>
nnoremap <silent> <leader>gp :Git pull<CR>
nnoremap <silent> <leader>gP :Git push<CR>
nnoremap <silent> <leader>gl :Git log<CR>
nnoremap <silent> <leader>gds :Gvdiffsplit<CR>
" Allows using FZF BCommits to get commit hash to clipboard and then compare it with current state of file
nnoremap <silent> <leader>gdc :Gvdiffsplit <C-r>0<CR>

" Split line at cursor (opposite of J)
nnoremap <leader>J i<CR><Esc>g; 

" Removes highlighting until next search
nnoremap <leader>hl :noh<CR>

" Open help in vertically split window
nnoremap <leader>he :vert bo h 

" Nerdtree toggle
nnoremap <leader>e :NERDTreeToggle<CR>

" Toggles line and relative linenumbers
nnoremap <leader>nu :set number!<CR> :set relativenumber!<CR>

" Show undo tree
nnoremap <leader>uu :MundoToggle<CR>

" VimDiff mode
vnoremap <leader>dp :diffput<CR>
vnoremap <leader>do :diffobtain<CR>

" Diff mode
nnoremap <leader>df :vert diffsplit 
nnoremap <leader>ds :windo diffthis<CR>

" Show yank buffer
nnoremap <silent> <leader>yy :YRShow<CR>

" Show/hide spell check underline
nnoremap <silent> <leader>spl <Cmd>setlocal spell! spelllang=en,de<CR> <Cmd>echo "Spellcheck toggled"<CR>

"Save or Close current buffer(s) or windows
nnoremap <leader>qq :qall<CR>
nnoremap <leader>; :wall<CR>
nnoremap <leader>wq :close<CR>
nnoremap <leader>wo :only<CR>

nnoremap <leader>qc :cclose<CR>

" Repeat last command from command line
nnoremap <Leader>, :norm @:<CR>

"""""""" --------------- Mappings ------------------------
" Pressing j twice in insert mode will lead to Esc
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kk <Esc>
inoremap JJ <Esc>

" Easymotion - `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-s2)
map  f <Plug>(easymotion-fl)
map  F <Plug>(easymotion-Fl)
map  t <Plug>(easymotion-tl)
map  T <Plug>(easymotion-Tl)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Subversive substitution command
nmap S <Plug>(SubversiveSubstitute)

" Quickly save out of insert mode directly
inoremap ZZ <Esc>:wq<CR>

" Save current buffer
nnoremap ; :update<CR>

" Quickly delete current buffer
nnoremap q :Bdelete<CR>
" Start macro with Q instead of q
nnoremap Q q

" Repeat last used macro
nnoremap , :norm @@<CR>

" Map arrows keys to more useful functions like changing buffers and page up/down
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>
nnoremap <Left> g^
nnoremap <Right> g$
nnoremap <Up> <C-b>
nnoremap <Down> <C-f>
vnoremap <Up> <C-b>
vnoremap <Down> <C-f>
vnoremap <Left> g^
vnoremap <Right> g$

" No overwriting of paste register
nnoremap x "_x
vnoremap p "_dP

" Allows easy searching of word under cursor within current project
nnoremap gw :Rg <cWORD><CR>

" Allows easy copying to end of line
nnoremap Y y$

" Keeps stuff centered when searching in file
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Insert line below or above without entering insert mode (works with Count)
nnoremap <silent> oo :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> OO :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" Helps move entire block in visual mode
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
" Helps move line in insert mode
inoremap ∆ <esc>:m .+1<CR>==gi
inoremap ˚ <esc>:m .-2<CR>==gi
" Helps move line in normal mode
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

" Stay in indent mode
vnoremap < <gv
vnoremap > >gv

" Create an undo checkpoint for writing prose easier
inoremap ! !<C-g>u
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u
inoremap ? ?<C-g>u
inoremap ( <C-g>u(
inoremap ) )<C-g>u

"""""""" --------------- CTRL Mappings ------------------------
nnoremap <C-s> :w<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <C-e> :!rg vimwiki ~/Dropbox/Apps/vimwiki<CR>

" Go to next or previous window
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

"Resize with arrows
nnoremap <C-Up> <Cmd>resize -2<CR> 
nnoremap <C-Down> <Cmd>resize +2<CR> 
nnoremap <C-Left> <Cmd>vertical resize -2<CR> 
nnoremap <C-Right> <Cmd>vertical resize +2<CR> 

" Create an undo checkpoint before deleting words or lines in insert mode
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" Switch functions for easier jumping to definition and showing list of all tags
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>
vnoremap g<C-]> <C-]>

" FZF Insert mode completion
imap <C-x><C-d> <plug>(fzf-complete-word)
imap <C-x><C-f> <plug>(fzf-complete-path)
imap <C-x><C-g> <plug>(fzf-complete-line)

"FZF common commands
nnoremap <silent> <C-b> :BCommits<CR>

"""""""" --------------- Text Objects ------------------------
" (entire line sans white-space; cursor at beginning--ie, ^)
xnoremap <silent> il :<C-u>normal! g_v^<cr>
onoremap <silent> il :<C-u>normal! g_v^<cr>
" (entire line sans trailing newline; cursor at beginning--ie, 0)
xnoremap <silent> al :<C-u>normal! $v0<cr>
onoremap <silent> al :<C-u>normal! $v0<cr>
