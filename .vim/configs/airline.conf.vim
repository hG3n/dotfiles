""""""""""""""""""
"--- AIRLINE  ---"
""""""""""""""""""
  set laststatus=2

  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''

  let g:airline_detect_modified=1
  let g:airline_detect_paste=1
  let g:airline_detect_iminsert=0

  let g:airline_inactive_collapse=1

  let g:airline_theme = 'powerlineish'

  let g:airline_theme_patch_func = 'AirlineThemePatch'
  function! AirlineThemePatch(palette)
    if g:airline_theme == 'badwolf'
      for colors in values(a:palette.inactive)
        let colors[3] = 245
      endfor
    endif
  endfunction

  let g:airline_powerline_fonts=1
  let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

  let g:airline_exclude_filenames = [] " see source for current list
  let g:airline_exclude_filetypes = [] " see source for current list
  let g:airline_exclude_preview = 0
  let w:airline_disabled = 0

  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#branch#format = 1

