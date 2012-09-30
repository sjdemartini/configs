" Use Vim settings, rather than Vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible
set modeline

"Set colorscheme and font:
colorscheme wombat
set guifont=Courier_new:h10

syntax on " enable syntax highlighting
filetype on " enable filetype detection
filetype plugin indent on " enable loading indent file for filetype

let g:pyflakes_use_quickfix = 0 " Prevent pyflakes from using quickfix window

" Enable pylint for error-checking with python files:
autocmd FileType python compiler pylint
let g:pylint_onwrite = 0

" Make vim automatically source (i.e., reload) the vimrc each time it is saved
autocmd bufwritepost .vimrc source $MYVIMRC

"Automatically remove all trailing whitespace:
autocmd BufWritePre * :%s/\s\+$//e

" Make default html file-teype djangohtml to support django syntax highlighting
autocmd BufRead,BufNewFile *.html set filetype=htmldjango

" Set tab width to 4, and use expandtab to use spaces for tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Turn on smart indenting (helps for C-like languages):
set smartindent
" Prevent smartindent for python files
autocmd FileType python set nosmartindent

" Set pastetoggle so that when on, pasting preserves indentation from text
" copied from external applications:
set pastetoggle=<F2>

set number "show line number
"hi LineNr ctermfg=magenta "change line number color to magenta
set cc=80 "color columns > 80 characters
set title "show title in window console

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set hlsearch "highlight search results (use :noh to remove highlights)

"Map F5 and F6 keys to previous and next tabs:
map <F5> :tabp<CR>
map <F6> :tabn<CR>

"Change temp file locations:
set backup "Turn on backup files
set backupdir=$VIM\temp "Set location to store backups
set dir=$VIM\temp "Set where to store swap files

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"Make unix the default fileformat
set fileformats=unix,dos
set fileformat=unix

"CDC = Change to Directory of Current file
command CDC cd %:p:h

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

