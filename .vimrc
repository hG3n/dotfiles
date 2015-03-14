"""""""""""""""""""""""""""
"--- GENERAL  SETTINGS ---"
"""""""""""""""""""""""""""
scriptencoding utf-8
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

set backspace=indent,eol,start "in case bcksp isnt working well"
set nocompatible        "changes options as as sideeffect"
set shiftwidth=2
set softtabstop=2       "set Tabvalue=4"dd
set ruler               "always show actual position" 
set nu                  "side indexnunbers" 
set history=1000
set undolevels=1000
set noswapfile          "disable creating stupid .swp files"
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

"colorscheme"
set t_Co=256
colorscheme monokai

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

"""""""""""""""""""""""
"--- !! VUNDLE !! --- "
"""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle

call vundle#begin()
  Plugin 'gmarik/vundle'
  Plugin 'shougo/neocomplete'
  Plugin 'bling/vim-airline'
  Plugin 'sjl/gundo.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'scrooloose/syntastic'
  Plugin 'Yggdroot/indentLine'
  Plugin 'vim-scripts/SearchComplete'
  Plugin 'scrooloose/nerdtree'
call vundle#end()

filetype plugin indent on

"""""""""""""""""""""""
"--- CONFIG FILES  ---"
"""""""""""""""""""""""
" using external files to keep an overview on that file
" neocomplete settings length sucks, airline as well
source ~/.vim/configs/airline.conf.vim
source ~/.vim/configs/neocomplete.conf.vim

"""""""""""""""""""
"--- SYNTASTIC ---"
"""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""
"--- NERDTREE  ---"
"""""""""""""""""""
let g:indentLine_color_term = 239
let g:indentLine_char = '·'


"""""""""""""""""""
"--- NERDTREE  ---"
"""""""""""""""""""
"map <C-n> :NERDTree <CR>
"nmap <leader> Nt :NERDTree <CR>

""""""""""""""""""""""""""""""
"--- OTHER MINOR SETTINGS ---"
""""""""""""""""""""""""""""""
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

"ignore fileendings in wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

"Sudo to write
 cnoremap w!! w !sudo tee % >/dev/null

"return to the same line if reopen a file"
"props to steve losh
augroup line_return
  au!
    au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif
augroup END

"Copying text to the system clipboard.
"For some reason Vim no longer wants to talk to the OS X pasteboard through
"Computers are bullshit.
"props to steve losh. again.
function! g:FuckingCopyTheTextPlease()
  let old_z = @z
  normal! gv"zy
  call system('pbcopy', @z)
  let @z = old_z
endfunction
noremap <leader>p :silent! set paste<CR>"*p:set nopaste<CR>
" noremap <leader>p mz:r!pbpaste<cr>`z
vnoremap <leader>y :<c-u>call g:FuckingCopyTheTextPlease()<cr>
nnoremap <leader>y VV:<c-u>call g:FuckingCopyTheTextPlease()<cr>



