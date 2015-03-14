"""""""""""""""""""""""""""
"--- GENERAL  SETTINGS ---"
"""""""""""""""""""""""""""
scriptencoding utf-8
set backspace=indent,eol,start "in case bcksp isnt working well"
set nocompatible        "changes options as as sideeffect"
set shiftwidth=2
set softtabstop=2       "set Tabvalue=4"dd
set ruler               "always show actual position" 
set nu                  "side indexnunbers" 
set history=1000
set undolevels=1000
set noswapfile          "disable creating .swp files"
set autoindent
set title               "sets filename on top of the open window"
set wildmenu            "sets the autocomplete in commandline"
set showmode            "shows the actual mode"
set mouse=a             "enables Mouse in vim"

set showcmd             "show partial commands in status line and
                        "selected characters/lines in visual mode"
set showmatch           "show matching brackets/parenthesis
set incsearch           "find as you type search"
set hlsearch            "highlights searched objects"

set expandtab                       "set tabs to spaces
"set list listchars=tab:-\ \,trail:· "set points after
let mapleader = ","                 "creates mapleader do do more key combinations
let g:mapleader = ","

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

"enables codefolding"
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1

"enables syntax detection"
syntax on

"Stupid shift key fixes"
cmap X      x
cmap W      w
cmap Q      q
cmap WQ     wq
cmap wQ     wq
cmap Tabe   tabe
cmap qq     q!
cmap xx     x!
cmap ww     w!

"Yank from the cursor to the end of the line, to be consistent with C and D"
nnoremap Y y$

"convert every umlaut into HTML Format"
function HtmlEscape()
  silent s/ö/\&ouml;/eg
  silent s/ä/\&auml;/eg
  silent s/ü/\&uuml;/eg
  silent s/Ö/\&Ouml;/eg
  silent s/Ä/\&Auml;/eg
  silent s/Ü/\&Uuml;/eg
  silent s/ß/\&szlig;/eg
endfunction
map <silent> <c-h> :call HtmlEscape()<CR>

"run current programs"
autocmd Filetype python map <F5> :w <CR>:!python "%"<CR>

"compile tex document"
autocmd Filetype tex map <c-t> :w <CR> !!lualatex *.tex <CR>

"""""""""""""""""""""""
"--- !! VUNDLE !! --- "
"""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle

call vundle#begin()
  Bundle 'gmarik/vundle'
  Bundle 'shougo/neocomplete'
  Bundle 'bling/vim-airline'
  Bundle 'sjl/gundo.vim'
  Bundle 'tpope/vim-fugitive'
  Bundle 'scrooloose/syntastic'
call vundle#end()

filetype plugin indent on

""""""""""""""""""
"--- AIRLINE  ---"
""""""""""""""""""
source ~/.vim/configs/airline.vim

"""""""""""""""""""""
"--- NEOCOMPLETE ---"
"""""""""""""""""""""
source ~/.vim/configs/neocomplete.vim

"""""""""""""""""""
"--- SYNTASTIC ---"
"""""""""""""""""""

"""""""""""""""""""
"--- NERDTREE  ---"
"""""""""""""""""""
map <C-n> :NERDTree <CR>
nmap <leader> Nt :NERDTree <CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
