syntax on

"""""""" ---------------  Vim Plug (Plugin Manager) Setup ------------------
set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')

"""  List plugins here
Plug 'sheerun/vim-polyglot'                     "Provides syntax for multiple filetypes
Plug 'airblade/vim-gitgutter'                   "Show changes in file from previous commit
Plug 'tpope/vim-fugitive'                       "Git integration plugin
Plug 'tpope/vim-rhubarb'                        "Git browse command to go to webpage directly
" Plug 'justinmk/vim-sneak'                       "Better search with 2,3 starting letters with s/S, operators with z/Z
Plug 'easymotion/vim-easymotion'                "New way of moving within vim
Plug 'tpope/vim-commentary'                     "Allows commenting lines/selection with gc
Plug 'tpope/vim-surround'                       "Allows surrounding words/selection with cs
Plug 'wellle/targets.vim'                       "Provides more operators than standard vim e.g v2il'
Plug 'tpope/vim-repeat'                         "Allows repeating more previous commands with .
Plug 'tommcdo/vim-exchange'                     "Allows exchanging words/selection with cx/X
Plug 'tpope/vim-endwise'                        "Automatically ends functions like if etc.
Plug 'tpope/vim-abolish'                        "Better robust substition and easier case changing
Plug 'Raimondi/delimitMate'                     "Automatically creates bracket pairs
Plug 'michaeljsmith/vim-indent-object'          "Autoindents lines
Plug 'machakann/vim-highlightedyank'            "Highlights yanks for short period
Plug 'SirVer/ultisnips'                         "Track the snippet engine
Plug 'honza/vim-snippets'                       "Snippets are separated from the engine
Plug 'ludovicchabant/vim-gutentags'             "Auto generation of tags
Plug 'ycm-core/YouCompleteMe'                   "Autocompletion
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                         "Fuzzy finding within vim with :Files
Plug 'pbogut/fzf-mru.vim'                       "Bring Most Recently Used Functionality to FZF
Plug 'vim-scripts/YankRing.vim'                 "Stores multiples yanks
Plug 'simnalamburt/vim-mundo'                   "Stores multiples undos
Plug 'scrooloose/nerdtree'                      "Allows navigation of file tree
Plug 'aymericbeaumet/vim-symlink'               "Follows symlink rather than editing the symlink
Plug 'moll/vim-bbye'                            "Better buffer management with :Bdelete etc.
Plug 'junegunn/goyo.vim'                        "Distraction free vim
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }     "Easy note taking and diary maintaining
Plug 'tbabej/taskwiki'                          "Integration of taskwarrior with vimwiki
Plug 'lervag/vimtex'                            "Latex syntax plugin that provides viewing with zathura
Plug 'vim-pandoc/vim-pandoc'                    "Pandoc support from within vim
Plug 'vim-pandoc/vim-pandoc-syntax'             "Pandoc syntax for relevant files
Plug 'kbarrette/mediummode'                     "Disable common vim navigation functions to help learn vim faster

""" Theme plugins
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'

""" Airline/Lightline/Bufferline plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

"""""""" ----------------- Plugin Settings ---------------
""" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
set completeopt+=popup
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
let g:ycm_key_list_select_completion = ['<Down>']                   "Default is Tab and Down
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

""" fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7} }
" This command changes the default :Rg command to work with hidden files
command! -bang -nargs=* Rg call fzf#vim#grep("rg --hidden --follow --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Ultisnips (if using tab as expand trigger, change corresponding usage in YCM)
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsListSnippets = "<c-tab>"
" let g:UltiSnipsJumpForwardTrigger = "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit = "vertical"

""" Gutentags
set statusline+=%{gutentags#statusline()}                           " Shows when tags are being generated
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_resolve_symlinks = 1
let g:gutentags_project_root = ['index.md']
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]

""" Highlight Yank
let g:yankring_history_file = '.yankring_history'
" let g:highlightedyank_highlight_duration = "200"
let g:yankring_zap_keys = ''                "Helps prevent yankring for hijacking y/c/d

""" Mediummode
let g:mediummode_enabled = 0
let g:mediummode_allowed_motions = 4

""" VimWiki
let g:vimwiki_list = [{'path': '~/Dropbox/Apps/vimwiki/',
                        \ 'syntax': 'markdown', 'ext': '.md',
                        \ 'links_space_char': '-',
                        \ 'auto_diary_index': 1}]
let g:vimwiki_markdown_link_ext = 1             "Generates links as [text](text.md)
" let g:vimwiki_listsyms = '✗○◐●✓'              "Unable to use these because taskwiki does not allow these unicode characters

""" TaskWiki
" let g:taskwiki_disable="yes"
" let g:taskwiki_suppress_mappings="yes"
let g:taskwiki_dont_fold="yes"
let g:taskwiki_markup_syntax = 'markdown'       "Has no documentation as of 20 Apr 2022
let g:taskwiki_disable_concealcursor="yes"
" let g:taskwiki_maplocalleader="\t"

""" Vimtex
let g:vimtex_view_method = 'zathura'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
autocmd VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

""" EasyMotion
let g:EasyMotion_keys = 'jkdslaeiruvmcghwoxtybnzqp;slf' "default : 'asdghklqwertyuiopzxcvbnmfj;'
let g:EasyMotion_do_mapping = 0 " Enable/Disable default mappings
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

""" Bufferline
let g:bufferline_echo = 0

""" Airline
" let g:airline_disable_statusline = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_theme='dark'
let g:airline_stl_path_style = 'short'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#hunks#enabled = 0
let g:airline_detect_spelllang=0
let g:airline_section_y = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline_symbols.maxlinenr= ''
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#gutentags#enabled = 1

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
set clipboard=unnamed           " yank and paste with the system clipboard
set encoding=utf-8
set expandtab                   " tabs are spaces
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
set list                        " show trailing whitespace
set listchars=tab:▸\ ,trail:▫   " list of characters to show
set wrap                        " automatically wrap on load
set wrapscan                    " Allow search to wrap to start of file
set breakindent                 " enable indentation on linebreak
set linebreak                   " enable softwrap without breaking words
set textwidth=0                 " No hard wrap of text; default 80
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
set background=dark             " For colorscheme
set shortmess=a                 " Abbreviates file messages to prevent hit enter to continue message
set grepprg=rg\ --vimgrep\ --smart-case\ --follow\ --hidden
set nrformats+=alpha

" if !$TERM_PROGRAM =~ "Apple_Terminal"
" if $TERM_PROGRAM == "iTerm.app"
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors             " Set true color (use only when terminal supports true colors)
" endif
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

" ---- Solarized Dark True Color
" autocmd vimenter * ++nested colorscheme solarized8_flat
" let g:airline_theme= 'solarized'
" let g:lightline.colorscheme = 'solarized'

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

" Sets current directory to the directory of file in current window
autocmd BufEnter * silent! lcd %:p:h

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

"""""""" --------------- File Specific Autocommands ------------------------
autocmd BufRead,BufNewFile *.py let python_highlight_all=1
" autocmd FileType vim setlocal shiftwidth=4 tabstop=4 expandtab
" autocmd FileType tex setlocal shiftwidth=4 tabstop=4 expandtab
augroup vimrc-vimwiki
    autocmd!
    autocmd FileType vimwiki
            \ autocmd BufLeave <buffer> silent update
    autocmd FileType vimwiki highlight link VimwikiHeader3 GruvboxAquaBold
    autocmd FileType vimwiki highlight link VimwikiHeader2 GruvboxYellowBold
augroup END

"""""""" --------------- leader Mappings ------------------------
" leader is now set to Spacebar
let mapleader = " "
" localleader is now set to Backspace
let maplocalleader = "\<BS>"

" Switch between the last two files
nnoremap <silent> <leader><leader> <C-^>

" Open and source ideavimrc
nnoremap <leader>ei <Cmd>w<CR> <Cmd>edit ~/.ideavimrc <CR>
nnoremap <leader>si <Cmd>w<CR> <Cmd>source ~/.ideavimrc <CR> <Cmd>echo "Sourced ideavimrc" <CR>
" Open and source zshrc
nnoremap <leader>ez <Cmd>w<CR> <Cmd>edit ~/.zshrc <CR>
nnoremap <leader>sz <Cmd>w<CR> <Cmd>source ~/.zshrc <CR> <Cmd>echo "Sourced zshrc" <CR>
" Open zsh aliases
nnoremap <leader>ea <Cmd>w<CR> <Cmd>edit ~/.oh-my-zsh/custom/aliases.zsh <CR>
" Open and source vimrc
nnoremap <leader>ev <Cmd>w<CR> <Cmd>edit ~/.vimrc <CR>
nnoremap <leader>sv <Cmd>w<CR> <Cmd>source ~/.vimrc <CR> <Cmd>echo "Sourced vimrc" <CR>
" Open and source bashrc
nnoremap <leader>eb <Cmd>w<CR> <Cmd>edit ~/.bashrc <CR>
nnoremap <leader>sb <Cmd>w<CR> <Cmd>source ~/.bashrc <CR> <Cmd>echo "Sourced bashrc" <CR>
" Open and source tmux conf
nnoremap <leader>et <Cmd>w<CR> <Cmd>edit ~/.tmux.conf <CR>

" Manage Plugins
nnoremap <silent> <leader>pi <Cmd>PlugInstall<CR>
nnoremap <silent> <leader>pu <Cmd>PlugUpdate<CR>
nnoremap <silent> <leader>pc <Cmd>PlugClean<CR>

" Fuzzy searching with fzf
nnoremap <silent> <localleader>ff <Cmd>FZFMru<CR>
nnoremap <silent> <localleader>fs <Cmd>Files<CR>
nnoremap <silent> <localleader>fg <Cmd>GFiles<CR>
nnoremap <silent> <localleader>fb <Cmd>BCommits<CR>
nnoremap <silent> <localleader>fc <Cmd>Commits<CR>
nnoremap <silent> <localleader>fu <Cmd>Buffers<CR>
nnoremap <silent> <localleader>ft <Cmd>Tags<CR>
nnoremap <silent> <localleader>fh <Cmd>Files ~<CR>
nnoremap <silent> <localleader>fd <Cmd>Files ~/.dotfiles<CR>
nnoremap <silent> <localleader>fa <Cmd>Files ~/Github_Repositories/Overleaf/DoctoralThesis-Overleaf<CR>
nnoremap <silent> <localleader>fj <Cmd>Files ~/Github_Repositories/Overleaf/Job_Application_CV-Github<CR>
nnoremap <silent> <localleader>fw <Cmd>Files ~/Dropbox/Apps/vimwiki<CR>
nnoremap <silent> <leader>/ <Cmd>BLines<CR>
nnoremap <silent> <leader>' <Cmd>Marks<CR>

" Git Fugitive mappings
nnoremap <silent> <leader>gs <Cmd>Git<CR>
nnoremap <silent> <leader>gb <Cmd>Git blame<CR>
nnoremap <silent> <leader>gc <Cmd>Git commit<CR>
nnoremap <silent> <leader>gp <Cmd>Git push<CR>
nnoremap <silent> <leader>gl <Cmd>Git log<CR>
nnoremap <silent> <leader>grs ciwsquash<Esc>0j
nnoremap <silent> <leader>grf ciwfixup<Esc>0j
nnoremap <silent> <leader>grp ciwpick<Esc>0j

" Goyo mappings
nnoremap <silent> <leader>go <Cmd>Goyo<CR>
nnoremap <silent> <leader>gy <Cmd>Goyo 120x100%<CR>

" Quickly insert an empty new line without entering insert mode
" nnoremap <leader>o o<Esc>
" nnoremap <leader>O O<Esc>

" Removes highlighting until next search
nnoremap <leader>hl <Cmd>noh<CR>

" Open help in vertically split window
nnoremap <leader>he :vert bo h 

" Medium mode enable and disable
nnoremap <leader>hm <Cmd>MediumModeToggle<CR>

" Nerdtree toggle
nnoremap <leader>nn <Cmd>NERDTreeToggle<CR>

" Toggles line and relative linenumbers
nnoremap <leader>nu <Cmd>set number!<CR> <Cmd>set relativenumber!<CR>

" Show undo tree
nnoremap <leader>uu <Cmd>MundoToggle<CR>

" Column mode selection
nnoremap <leader>vv <C-v>

" VimDiff mode
nnoremap <leader>dp <Cmd>diffput<CR>
nnoremap <leader>do <Cmd>diffobtain<CR>

" Diff mode
nnoremap <leader>df <Cmd>vert diffsplit 
nnoremap <leader>ds <Cmd>windo diffthis<CR>

" Show yank buffer
nnoremap <silent> <leader>yy <Cmd>YRShow<CR>

" Go to specific buffer
" nnoremap <leader>hh <Cmd>bp<CR>
" nnoremap <leader>ll <Cmd>bn<CR>

" Go to next or previous window
nnoremap <leader>kj  <C-w>h
nnoremap <leader>jk  <C-w>l
nnoremap <leader>jj  <C-w>j
nnoremap <leader>kk  <C-w>k

"Save or Close current buffer(s)
nnoremap <leader>aa <Cmd>Bdelete<CR>
nnoremap <leader>rr ZZ<CR>
nnoremap <leader>re <Cmd>wqall<CR>
nnoremap <leader>ee <Cmd>wall<CR><Esc>
nnoremap <leader>qq <Cmd>q!<CR>

"""""""" --------------- Mappings ------------------------
" Pressing j twice in insert mode will lead to Esc
inoremap jj <Esc>

" Easymotion - `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-s2)
map  f <Plug>(easymotion-fl)
map  F <Plug>(easymotion-Fl)
map  t <Plug>(easymotion-tl)
map  T <Plug>(easymotion-Tl)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map ; <Plug>(easymotion-k)
map , <Plug>(easymotion-j)

" Quickly save out of insert mode directly
inoremap ZZ <Cmd>wq<CR>

" Map arrows keys to more useful functions like changing buffers and page up/down
nnoremap <Left> <Cmd>bprevious<CR>
nnoremap <Right> <Cmd>bnext<CR>
nnoremap <Up> <C-b>
nnoremap <Down> <C-f>
vnoremap <Up> <C-b>
vnoremap <Down> <C-f>

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
inoremap ∆ <esc><Cmd>m .+1<CR>==gi
inoremap ˚ <esc><Cmd>m .-2<CR>==gi
" Helps move line in normal mode
nnoremap ∆ <Cmd>m .+1<CR>==
nnoremap ˚ <Cmd>m .-2<CR>==

"""""""" --------------- CTRL Mappings ------------------------
nnoremap <C-s> <Cmd>w<CR>
nnoremap <C-f> <Cmd>Rg<CR>

" Create an undo checkpoint before deleting words or lines in insert mode
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

"""""""" --------------- Function Mappings ------------------------
" Insert current date and time
nnoremap <F5> "=strftime("%c")<CR>P
