" ____                 _           _               _                    
"| __ )  ___ _ __  ___| |__  _   _( )___    __   _(_)_ __ ___  _ __ ___ 
"|  _ \ / _ \ '_ \/ __| '_ \| | | |// __|   \ \ / / | '_ ` _ \| '__/ __|
"| |_) |  __/ | | \__ \ | | | |_| | \__ \    \ V /| | | | | | | | | (__ 
"|____/ \___|_| |_|___/_| |_|\__,_| |___/   (_)_/ |_|_| |_| |_|_|  \___|
"                                                                       
" Make Vim more useful
set nocompatible              " be iMproved
"filetype off                  " Testing - to see if it's redundant (Should go down on next commit)
"
"                       _ _              _             _       
"__   ___   _ _ __   __| | | ___   _ __ | |_   _  __ _(_)_ __  
"\ \ / / | | | '_ \ / _` | |/ _ \ | '_ \| | | | |/ _` | | '_ \ 
" \ V /| |_| | | | | (_| | |  __/ | |_) | | |_| | (_| | | | | |
"  \_/  \__,_|_| |_|\__,_|_|\___| | .__/|_|\__,_|\__, |_|_| |_|
"                                 |_|            |___/         
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin '907th/vim-auto-save'
"Plugin 'lervag/vimtex', { 'for': 'tex' }
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'https://github.com/scrooloose/nerdcommenter'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
"Themes
Plugin 'tomasr/molokai'
Plugin 'https://github.com/sickill/vim-monokai'
Plugin 'jellybeans.vim'
Plugin 'https://github.com/digitaltoad/vim-pug'
call vundle#end()
filetype plugin indent on

" ____  _             _         ____       _   _   _                 
"|  _ \| |_   _  __ _(_)_ __   / ___|  ___| |_| |_(_)_ __   __ _ ___ 
"| |_) | | | | |/ _` | | '_ \  \___ \ / _ \ __| __| | '_ \ / _` / __|
"|  __/| | |_| | (_| | | | | |  ___) |  __/ |_| |_| | | | | (_| \__ \
"|_|   |_|\__,_|\__, |_|_| |_| |____/ \___|\__|\__|_|_| |_|\__, |___/
"               |___/                                      |___/     


"Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"Emmet settings
let g:user_emmet_settings = {'jade' : { 'extends' : 'html',},}
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in .gitignore

"clang formatter for c files
map <C-K> :pyf /usr/local/Cellar/clang-format/2016-03-29/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/local/Cellar/clang-format/2016-03-29/share/clang/clang-format.py<cr>

" Python breakpoints shortcuts
au FileType python map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>
set iskeyword+=:

" YCM settings
"
nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1
"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = 'python' "default ''
let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

" Synatstic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec='python'

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Latex plugins settings
set grepprg=grep\ -nH\ $* " For latex-suite
let g:tex_flavor='latex'

"Forward search with skim
map ,r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> diff.pdf<CR>

" Setup autosave plugin, off by default, enable with :AutoSaveToggle 
let g:auto_save = 0
let g:auto_save_in_insert_mode = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

"__     _____ __  __            _   _   _                 
"\ \   / /_ _|  \/  |  ___  ___| |_| |_(_)_ __   __ _ ___ 
" \ \ / / | || |\/| | / __|/ _ \ __| __| | '_ \ / _` / __|
"  \ V /  | || |  | | \__ \  __/ |_| |_| | | | | (_| \__ \
"   \_/  |___|_|  |_| |___/\___|\__|\__|_|_| |_|\__, |___/
"                                               |___/     
" Prevent delay when esc. from insert mode (Should be os x only)
set timeoutlen=1000 ttimeoutlen=0

set wildignore+=*/tmp/*,*.so,*.o,*.swp,*.zip,*.png,*.jpg
syntax enable
"set background=dark
"let g:solarized_termtrans=256
colorscheme molokai
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=4
" Set indentation to expand to 4 spaces
set shiftwidth=4
" Expand tabs to spaces
set expandtab

" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Run line under cursor as shell command and paste output to buffer
noremap      Q !!$SHELL<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" execute the current line of text as a shell command

if has("gui_running")
				set guifont=Inconsolata\ for\ Powerline:h16
				set linespace=1
endif
