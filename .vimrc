" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
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
"set belloff=all

" mouse control
set mouse=a
set ttymouse=sgr
set ttyfast
nnoremap <X1Mouse> <C-O>
nnoremap <X2Mouse> <C-I>

" search/regex control
"set gdefault
set ignorecase
set smartcase
set nohlsearch
set incsearch

" scrolling
noremap H ^
noremap L $
noremap J 10j
noremap K 10k
set scrolloff=5
set sidescrolloff=5
set sidescroll=1

" diff settings
set diffopt+=vertical

" Display extra whitespace
set list listchars=tab:»·,nbsp:·

" Map Ctrl + S to save in any mode
" uncomment to select between returning to normal mode or not
noremap <silent> <C-S>          :update<CR>
" vnoremap <silent> <C-S>         <C-C>:update<CR>
vnoremap <silent> <C-S> <ESC>:update<CR>
" inoremap <silent> <C-S>         <C-O>:update<CR>
inoremap <silent> <C-S> <ESC>:update<CR>

" Make it obvious where 80 characters is
set textwidth=80
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1
hi ColorColumn ctermbg=0 guibg=#202020


" set gui options
set guioptions+=b
set guioptions-=T

" tabs and buffers
set hidden

" don't use Ex mode (why even have that mode??)
map Q gq

" misc options
set history=50
set showcmd

" enable some MS-Windows behaviors but not the obnoxious ones
set selection=exclusive
set keymodel=startsel
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
map <C-V>		"+gP
map <S-Insert>		"+gP
cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+
imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>
noremap <C-Z> u
inoremap <C-Z> <C-O>u
"noremap <C-Y> <C-R>
"inoremap <C-Y> <C-O><C-R>
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-A selects all
noremap <C-A> ggVG
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G

" buffer management with \b
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>
map <leader>bd :bd<cr>
"map <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>

" Pathogen plugin management
execute pathogen#infect()

" NERDCommenter defaults
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

" ; maps to :
noremap ; :

