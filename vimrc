" Don't bother with vi compatibility
set nocompatible

" Set temp dirs
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Configure Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" Git Plugins
Plugin 'tpope/vim-fugitive' 
Plugin 'airblade/vim-gitgutter'

" Status Line
Plugin 'bling/vim-airline'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'

" Theme
Plugin 'morhetz/gruvbox'

" File System Explorer
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Sublime-like multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Fuzzy file searching
Plugin 'kien/ctrlp.vim'

" Easy Motion
Plugin 'Lokaltog/vim-easymotion'

" Match opening delimeters with closing delimiters
Plugin 'Raimondi/delimitMate'

"" Language specifics
" C/C++
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'drmikehenry/vim-headerguard'

" GLSL
Plugin 'tikhomirov/vim-glsl'

" Python
Plugin 'jmcantrell/vim-virtualenv'

" Rust 
Plugin 'wting/rust.vim'

" Go
Plugin 'fatih/vim-go'

" Haskell
Plugin 'dag/vim2hs'

" Finish adding Vundle bundles
call vundle#end()
filetype plugin indent on

" Syntax on (of course!)
syntax on

" All powerful backspace
set backspace=2

" Colourful terminal when supported
set t_Co=256
set background=dark

" Colour scheme settings 
if !has("gui_running")
   let g:gruvbox_italic=0
endif
let g:gruvbox_bold=0
colorscheme gruvbox

" C++ syntax config
let g:cpp_class_scope_highlight = 1

" vim-go
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" YouCompleteMe default config
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm.py'
let g:ycm_confirm_extra_conf = 0

" Indentation
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

" Autoread
set autoread

" Unindent
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
vmap <S-Tab> <gv
vmap <Tab> >gv

" Line numbers
set number

" Enable the mouse
set mouse=a

" Display column and line numbers in the bottom right.
set ruler

" Only make searches case sensitive if they contain a capital letter
set smartcase
set hlsearch

" When splitting, display the new pane to the right of the existing pane for 
" vertical splits and below the existing pane for horizontal splits.
set splitright
set splitbelow

" Put pastemode on a toggle.
set pastetoggle=<F2>

" Highlight column 100
set colorcolumn=100

" Copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Save a keystroke, no need to hit shift.
map ; :

" Break line at cursor
map <C-j> i<CR><Esc>

if has("autocmd")
    " Have Vim jump to the last position when reopening a file
    autocmd VimResized * :wincmd =
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal! g'\"" | endif

    " Enable spell check for text files
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
    
    " File specific settings
    autocmd FileType make setlocal noexpandtab
    autocmd FileType python setlocal colorcolumn=80

    " Pintos
    autocmd BufNewFile,BufRead ~/Projects/Imperial/pintos_29/*/* setlocal cc=80 sts=2 ts=2 sw=2

    " Disable swapfiles in encrypted files
    autocmd BufNewFile,BufReadPre *.enc setlocal nobackup noswapfile viminfo=|
                \ setlocal cryptmethod=blowfish 
endif

" Use internationalised encoding when possible.
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

