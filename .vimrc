"""""""""""""""""""""""""""
"--- INSTALLED BUNDLES ---"
"""""""""""""""""""""""""""
" MANAGERS
"   vundle
"   pathogen
" PLUGINS
"   Screen-vim---gnu-screentmux
"   alternate                               "open header files simlutanoulsy
"   matchit                                 "jump to the end of a tag %-addon
"   neocomplcache                           "autocompletion menu
"       neocomplcache-snippets-complete     "code snippets for neocomplcache
"   nerdcommenter                           "
"   nerdtree                                "filebrowserbar for vim
"   powerline                               "advanced statusline
"   ragtag                                  "
"   repeat                                  "repeat commands did before
"   surround                                "delete change & edit surroundings
"   syntastic                               "syntax correction
"   tabular                                 "automaticly align text 
"   autoclose                               "automaticly close brackets and comment tags   
"   autoclose-html                          "automaticly close html tags
"   autoclose-tex                           "automaticly close tex tags
"   Indent-Guides
"   Gundo                                   "show undolevels as a tree
"   monokai                                 "monokai colorscheme
"   vim gist                                "upload gists directly to gist.github.com
"""""""""""""""""""""""""""

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
filetype plugin indent on

set showcmd             "show partial commands in status line and
                        "selected characters/lines in visual mode"
set showmatch           "show matching brackets/parenthesis
set incsearch           "find as you type search"
set hlsearch            "highlights searched objects"

set expandtab                       "set tabs to spaces
set list listchars=tab:-\ \,trail:· "set points after
let mapleader = ","                 "creates mapleader do do more key combinations
let g:mapleader = ","

"colorscheme
""colorscheme monokai

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
autocmd Filetype cpp map <F5> :w <CR>:!make <CR>

"compile tex document"
autocmd Filetype tex map <c-t> :w <CR> !!lualatex *.tex <CR>
"au FileType tex map <buffer> <c-t> :!pdflatex *.tex && open &.pdf<CR>

"autocomplete brackets"
"inoremap {      {} <Left>
"inoremap {<CR>  {<CR>}<Esc>0
"inoremap {{     {
"inoremap {}     {}

"""""""""""""""""""""""
"--- !! VUNDLE !! --- "
"""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

"""""""""""""""""""""""""""""""""""""""
"----- !!! BUNDLE MANAGEMENT !!! -----"
"-----------!! PATHOGEN !! -----------"
"----------- ! IMPORTANT ! -----------"
"""""""""""""""""""""""""""""""""""""""
call pathogen#infect()

"""""""""""""""""""""""
"--- NEOCOMPLCACHE ---"
"""""""""""""""""""""""

    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    imap <C-k>     <Plug>(neocomplcache_snippets_expand)
    smap <C-k>     <Plug>(neocomplcache_snippets_expand)
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " SuperTab like snippets behavior.
    "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
    "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

    "Popup Colors
    hi Pmenu        ctermbg=8
    hi PmenuSet     ctermbg=1
    hi PmenuSbar    ctermbg=0

"""""""""""""""""""
"--- POWERLINE ---"
"""""""""""""""""""
let g:powerline_symbols = 'fancy'

set laststatus=2        "always show the statusline
set encoding=utf-8      "necessary to shwo unicode glyphs
set t_Co=256            "explicitely tell vim that the terminal suports 256 colors

"""""""""""""""""""
"--- SYNTASTIC ---"
"""""""""""""""""""
"let g:syntastic_cpp_compiler_options = '-std=c++0x'

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

"""""""""""""""""""""""
"--- INDENT-GUIDES ---"
"""""""""""""""""""""""
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
