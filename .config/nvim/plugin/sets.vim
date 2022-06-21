" SETS DEFAULTS

set exrc

set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set colorcolumn=88
set guicursor=
set nohlsearch
set nowrap
set scrolloff=10
set sidescrolloff=10

set signcolumn=yes:2
set splitbelow

set hidden
set incsearch
set noerrorbells

set number
set relativenumber

set directory=~/.vim/dirs/tmp
set backup
set backupdir=~/.vim/dirs/backups
set undofile
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo

if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif
