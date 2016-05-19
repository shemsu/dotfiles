" Make Vim more useful
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin '907th/vim-auto-save'
Plugin 'lervag/vimtex', { 'for': 'tex' }
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'https://github.com/scrooloose/nerdcommenter'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
Plugin 'https://github.com/neilagabriel/vim-geeknote'
Plugin 'tomasr/molokai'
Plugin 'https://github.com/sickill/vim-monokai'
Plugin 'jellybeans.vim'
Plugin 'https://github.com/digitaltoad/vim-pug'
"Plugin 'https://github.com/terryma/vim-multiple-cursors'
"Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
call vundle#end()
filetype plugin indent on

" Prevent delay when esc. from insert mode
set timeoutlen=1000 ttimeoutlen=0

set wildignore+=*/tmp/*,*.so,*.o,*.swp,*.zip
"
" Use the Solarized Dark theme
"syntax enable
"set background=dark
"let g:solarized_termtrans=256
colorscheme molokai

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Ignore files in .gitignore
set grepprg=grep\ -nH\ $* " For latex-suite
let g:tex_flavor='latex'
"latex-suite-aka-vim-latex
"let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_CompileRule_pdf = 'latexmk -pdf -f $*'
set iskeyword+=:
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Setup autosave plugin, off by default, enable with :AutoSaveToggle
let g:auto_save = 0
let g:auto_save_in_insert_mode = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

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

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
"Forward search with skim
map ,r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> diff.pdf<CR>
" execute the current line of text as a shell command
noremap      Q !!$SHELL<CR>

if has("gui_running")
				set guifont=Inconsolata\ for\ Powerline:h16
				set linespace=1
endif

"Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"Emmet settings
let g:user_emmet_settings = {'jade' : { 'extends' : 'html',},}