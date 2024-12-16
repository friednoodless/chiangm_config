
let g:dotfiles_dir = fnamemodify(expand("<sfile>:h"), ":p")

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'preservim/nerdtree'
call plug#end()

if has("patch-9.0.0")
	colorscheme desert
else
	if &diff
		colorscheme slate
	else
		colorscheme elflord
	endif
endif

syntax on

" Enable mouse support.
set mouse=a

" Enable persistent undo.
set undofile

" Use incremental search and highlight as we go.
set hlsearch
set incsearch

" Search should be case insensitive unless containing uppercase characters.
set ignorecase
set smartcase

" Reduce screen redraw so macros run more quickly.
set lazyredraw
"
" Show line numbers as relative so relative navigation is easier. Show actual
" line number for active line.
set relativenumber
set number

" Show line and character number in lower right hand corner.
set ruler

" Only insert a single space after punctuations when using the automatic
" formatter (via dq).
set nojoinspaces

" Increase history for search and command line entries.
set history=10000

" Highlight the active line and the active column. The CursorLine color chosen
" here is a bit more prominent than the default.
set cursorline
set cursorcolumn
highlight CursorColumn ctermbg=lightcyan ctermfg=black



