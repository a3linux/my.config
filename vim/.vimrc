"
" Filename: ~/.vimrc
" Author: Allen Chen<a3linux@gmail.com>
" Update: 10/22/2012
"

" Ignore "evim" - easy vim, gvim with modeless
if v:progname =~? "evim"
	finish
endif

" General settings
set nocompatible
set backspace=indent,eol,start
set nobackup
set history=500
set showcmd
set autoread
set mat=2
set scrolloff=3
set sidescrolloff=2
set fen " Or set nofen

" UI settings
set background=dark
set laststatus=2
set statusline=%F%m%r%h%W\ [%{&ff}][%Y][%{&fenc}][%04l,%04v,%p%%\ %L]
set winminheight=1
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set noexpandtab " set expandtab
set linespace=0
set autoindent
set smartindent
set cindent
set wrap
set cmdheight=2
set number
"set showtabline=2
"set cursorline
set vb t_vb=
set mouse-=a
set mousehide
syntax on

" OS Special
set ffs=unix,dos,mac " Used on Linux

" Search settings
set incsearch
set hlsearch
set showmatch
set ignorecase
set infercase

set lbr " Not break line in word

set wildmenu
set ruler
set wildignore+=*.0,*~.lo
set suffixes+=.txt,.xml,.php,.c

" File encoding settings
set encoding=utf-8
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,ucs-bom,cp936

" Settings of Vundle
filetype off " filetype on later
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
"
" Begin My Bundles
"
" Programming
Bundle 'L9'
Bundle 'perl-support.vim'
Bundle 'bash-support.vim'
Bundle 'klen/python-mode'
Bundle 'Pydiction'
Bundle 'django.vim'
Bundle 'jslint.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle "jQuery"
Bundle "rails.vim"
Bundle "go.vim"
Bundle "hallison/vim-markdown"

"Bundle "http://github.com/gmarik/snipmate.vim.git"

" syntax highlight
Bundle "prop.vim"
Bundle "JSON.vim"

" git integration
Bundle "git.zip"
Bundle "fugitive.vim"

"(HT|X)ml tool
Bundle "xml.vim"
Bundle "matchit.zip"
Bundle "ragtag.vim"
Bundle "xmledit"
Bundle "docbkhelper"
Bundle "closetag.vim"

" SQL 
Bundle "sql.vim"

" doc
Bundle "php-doc"

Bundle "repeat.vim"
Bundle "surround.vim"
Bundle "SuperTab"
Bundle "file-line"
Bundle "Align"
Bundle "Auto-Pairs"

" Color schema
Bundle "tortex"
Bundle "EditPlus"
Bundle "altercation/vim-colors-solarized"

Bundle "CompleteHelper"
Bundle "CamelCaseComplete"

" End My Bundles 

filetype plugin on
filetype indent on

" Pydiction
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

" python-mode settings
let g:pymode_lint = 1
let g:pymode_lint_checker = "pep8"
let g:pymode_lint_write = 0
let g:pymode_run = 1
let g:pymode_run_key = 'R'
let g:pymode_lint_cwindow = 1
let g:pymode_folding = 0
let g:pymode_virtualenv = 1

" js/css/html beautify()
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

"Remove the blank at end of line for code
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e
autocmd BufWritePre *.pp :%s/\s\+$//e
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.htm :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd BufWritePre *.cxx :%s/\s\+$//e
autocmd BufWritePre *.ini :%s/\s\+$//e
autocmd BufWritePre *.java :%s/\s\+$//e
autocmd BufWritePre *.pl :%s/\s\+$//e
autocmd BufWritePre *.xml :%s/\s\+$//e
autocmd BufWritePre *.coffee :%s/\s\+$//e
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.sh :%s/\s\+$//e
autocmd BufWritePre *.C :%s/\s\+$//e
autocmd BufWritePre *.CPP :%s/\s\+$//e
autocmd BufWritePre *.H :%s/\s\+$//e
" autocmd BufWritePre *.conf :%s/\s\+$//e
"
let loaded_xmledit = 1
