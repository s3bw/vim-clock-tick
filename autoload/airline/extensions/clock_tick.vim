scriptencoding utf-8

" Avoid installing twice
if exists('g:loaded_vim_airline_clock_tick')
    finish
endif

if !exists('g:loaded_vim_airline_clock')
    echoerr "vim-airline-clock is not loaded!"
endif

" Default clock format
if !exists('g:airline#extensions#clock_tick#format')
  let g:airline#extensions#clock_tick#format = '%H:%M'
endif

" Effects the tick rate
if !exists('g:airline#extensions#clock_tick#delta')
  let g:airline#extensions#clock_tick#delta = 'H'
endif

let g:loaded_vim_airline_clock_tick = 1
let s:clock_ticks = {
    \1: '🕐 ',
    \2: '🕑 ',
    \3: '🕒 ',
    \4: '🕓 ',
    \5: '🕔 ',
    \6: '🕕 ',
    \7: '🕖 ',
    \8: '🕗 ',
    \9: '🕘 ',
    \10: '🕙 ',
    \11: '🕚 ',
    \12: '🕛 ',
\}

" Overwrite clock#format
function! airline#extensions#clock_tick#get()
    let mod = (strftime('%' .
        \ g:airline#extensions#clock_tick#delta) % 12) + 1
    let g:airline#extensions#clock#format = s:clock_ticks[mod] .
        \ strftime(g:airline#extensions#clock_tick#format)
endfunction

" Overwrite clock#get function
function! airline#extensions#clock#get()
  call airline#extensions#clock_tick#get()
  return g:airline#extensions#clock#format
endfunction
