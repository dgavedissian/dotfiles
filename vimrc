"""""""""""""""""""""""""""""
" Plugins                   "
"""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'                  " Vundle
Plugin 'joshdick/onedark.vim'               " Colour Scheme
Plugin 'tpope/vim-fugitive'                 " Git commands from vim
Plugin 'airblade/vim-gitgutter'             " Git status in the gutter
Plugin 'vim-airline/vim-airline'            " Status bar
Plugin 'scrooloose/nerdtree'                " File system explorer
Plugin 'jistr/vim-nerdtree-tabs'            " Better tab support for NERDTree
Plugin 'terryma/vim-multiple-cursors'       " Sublime-like multiple cursors
Plugin 'kien/ctrlp.vim'                     " Fuzzy file/string searching
Plugin 'Raimondi/delimitMate'               " Match opening delimiters with closing delimiters

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""
" Plugin Settings           "
"""""""""""""""""""""""""""""
let g:airline_theme='onedark'       " Use the correct powerline theme

"""""""""""""""""""""""""""""
"       Behaviour           "
"""""""""""""""""""""""""""""
set nocompatible                    " Don't behave like vi
set backupdir=$HOME/.vim/backup//   " Set backup directory
set directory=$HOME/.vim/backup//   " Set swap directory
set backspace=2                     " Backspace over more stuff
set autoread                        " Reload buffers if they've changed
set smartcase                       " Case sensitive if the search term contains capitals
set scrolloff=2                     " Start scrolling a few lines from the border
set visualbell                      " Use a colour blink instead of a sound
set whichwrap+=<,>,h,l              " Allow the cursor to wrap lines

"""""""""""""""""""""""""""""
" Persistence               "
"""""""""""""""""""""""""""""
set hidden                          " don't mark buffers as abandoned if hidden
set history=1000
set undofile                        " save undo's after file closes
set undodir=$HOME/.vim/undo         " where to save undo histories
set undolevels=1000                 " how many undos
set undoreload=10000                " number of lines to save for undo

"""""""""""""""""""""""""""""
" Formatting                "
"""""""""""""""""""""""""""""
set tabstop=4                       " Width of the tab character
set softtabstop=4                   " How many columns the tab key inserts
set shiftwidth=4                    " Width of 1 indentation level
set autoindent                      " (todo explain)
set smartindent                     " Smart C-like autoindenting
set expandtab                       " Expand tabs into spaces
set smarttab                        " (todo explain)"

"""""""""""""""""""""""""""""
" Interface                 "
"""""""""""""""""""""""""""""
set number                          " Enable line numbers
set mouse=a                         " Enable the mouse
set ruler                           " Display column and line numbers in the bottom right
set hlsearch                        " Highlight search results
set incsearch                       " Highlight search results as it is typed
set splitright                      " Place new horizontal splits to the right
set splitbelow                      " Place new vertical splits at the bottom
set colorcolumn=100                 " Highlight column 100
set background=dark                 " Set the colour scheme to be dark
set nofoldenable                    " Disable folding
colorscheme onedark                 " Set the colour scheme
syntax on                           " Turn on syntax highlighting

if has("gui_running")
    set guioptions-=T               " Remove toolbar
    set guioptions-=r               " Remove right-hand scroll bar
    set guioptions-=L               " Remove left-hand scroll bar
    set columns=140
    set lines=40
    if has("gui_gtk2")
        set guifont=Inconsolata-g\ Medium\ 10
    elseif has("gui_macvim")
        set guifont=Monaco:h12
    elseif has("gui_win32")
        set guifont=Consolas:h11:cANSI
    endif
else
    set t_Co=256                        " Enable a colourful terminal
endif

"""""""""""""""""""""""""""""
" Bindings                  "
"""""""""""""""""""""""""""""

" Unindent
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
vmap <S-Tab> <gv
vmap <Tab> >gv

" Copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Save a keystroke, no need to hit shift.
map ; :

" Break line at cursor
map <C-j> i<CR><Esc>

" Have Vim jump to the last position when reopening a file
autocmd VimResized * :wincmd =
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Enable spell check for text files
autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en

" librocket
autocmd BufNewFile,BufRead *.rcss set ft=css
autocmd BufNewFile,BufRead *.rml set ft=html

" When using YCM enabled languages, use it instead of ctags
autocmd FileType c,cpp,python map <C-]> :YcmCompleter GoTo<CR>

" Always use tabs in makefiles
autocmd FileType make setlocal noexpandtab

" Follow python PEP8
autocmd FileType python setlocal colorcolumn=80

" Disable swapfiles in encrypted files
autocmd BufNewFile,BufReadPre *.enc setlocal nobackup noswapfile viminfo=|
            \ setlocal cryptmethod=blowfish

