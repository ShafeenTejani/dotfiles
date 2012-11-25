call pathogen#infect()
" Load plugins pathogen-style.
call pathogen#infect('~/dotfiles/vim/bundle')

let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8/bin/ctags'

" Use Vim settings, rather than vi settings.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set showcmd
set ruler  " show the cursor position all the time

" numbers
set number
set numberwidth=5

" searching
set incsearch  " incremental search
set hlsearch   " highlight matches
set ignorecase " case insensitive
set smartcase  " case sensitive if it has captials

" autocompletion of file names
set wildmenu
set wildmode=full

" toggle TagBar
map <leader>t :TagbarToggle<cr>

" nerdtree
nnoremap <Leader>n :NERDTreeTabsToggle<CR>

" find the current file in the nerdtree
map <leader>f :NERDTreeFind<cr>

" Customise ctrl-p ignored files
set wildignore+=*/.git/*,*.so,*.swp,*.zip
" ignore play framework build dir
set wildignore+=*/target/*

" here we can either use jshint, jsl, gjslint, jslint, closurecompiler
let g:syntastic_javascript_checker='jshint'

" always display the status line
set laststatus=2

" syntax highlighting
syntax on
filetype plugin indent on
syntax enable

" colours
if has('gui_running')
	set background=light
else
	set background=dark
endif
	
colorscheme solarized

" fonts
if has("mac")
    set guifont=Menlo:h12
elseif has("unix")
    set guifont=Inconsolata\ 12
elseif has("win32")
    set guifont=Consolas:h12
endif

" some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

set noerrorbells
set visualbell

" tabbing
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

if has("autocmd")
    autocmd FileType ruby       setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType markdown   setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType html       setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType php        setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType css        setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType coffee     setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType scala      setlocal ts=2 sts=2 sw=2 expandtab
	autocmd BufNewFile,BufRead *.txt setfiletype text
	autocmd BufNewFile,BufRead *.as setfiletype actionscript
	autocmd BufNewFile,BufRead *.less setfiletype less
	autocmd BufNewFile,BufRead *.jst  setfiletype php
	autocmd BufNewFile,BufRead *.ctp  setfiletype php
	autocmd BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
	" Enable soft-wrapping for text files
	autocmd FileType text,markdown setlocal wrap linebreak nolist
endif

"Disable auto-folding of loaded files
set nofoldenable

set autoindent
set smartindent
set smarttab

" show hidden chars
" set list
set listchars=trail:⋅,nbsp:⋅,tab:▸\ ,eol:¬
set nowrap


" strip trailing whitespaces
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" command to strip white space from any file
nnoremap <leader>s :call <SID>StripTrailingWhitespaces()<cr>

