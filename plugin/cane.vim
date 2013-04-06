" cane.vim - Code quality threshold checking as part of your build
" Author: Rainer Borene <https://github.com/rainerborene>
" Version: 1.0

if exists("g:loaded_cane") || !executable("cane")
  finish
endif
let g:loaded_cane = 1

if !exists('g:cane_always_show')
  let g:cane_always_show = 1
endif

if !exists('g:cane_debug')
  let g:cane_debug = 0
endif

function! s:Cane()
  if exists('g:cane_line_limit') && line('$') > g:cane_line_limit
    return
  endif
  let output = system("cane -f " . expand("%:p") . " --json")
  if g:cane_debug
    echom output
  endif
  let loclist = []
  let bufnr = bufnr('%')
  for item in eval(output)
    let text = printf('%s - %s', item['description'],  item['label'])
    call add(loclist, { 'bufnr': bufnr, 'lnum': item['line'], 'text': text })
  endfor
  call setloclist(0, loclist)
  if len(loclist) > 0 && g:cane_always_show
    ll
  endif
endfunction

augroup cane_plugin
  autocmd!
  autocmd! BufReadPost,BufWritePost,FileReadPost,FileWritePost *.rb call s:Cane()
augroup END
