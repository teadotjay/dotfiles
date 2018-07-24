" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible
" use vim settings
set nocompatible

" tab and autoindent control
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set shiftround

" temporary files
set dir=~/tmp
set backupdir=~/tmp

" set relative numbering (see if I get used to it)
set relativenumber
set number

" turn off wrap
set nowrap

" fix my headache
set belloff=all

" mouse control
set mouse=a
set ttymouse=sgr
set ttyfast

" search/regex control
set gdefault
set ignorecase
set smartcase
set hlsearch!

" scrolling
noremap H ^
noremap L $
noremap J 10j
noremap K 10k
set scrolloff=5
set sidescrolloff=10
set sidescroll=1

" diff settings
set diffopt+=vertical

" vv selects entire line
noremap vv 0v$

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

"Map Ctrl + S to save in any mode
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Make it obvious where 100 characters is
set textwidth=100
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1
