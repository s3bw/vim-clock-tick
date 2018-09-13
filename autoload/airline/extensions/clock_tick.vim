scriptencoding utf-8

" Avoid installing twice
if exists('g:loaded_vim_airline_clock_tick')
    finish
endif


if !exists('g:loaded_vim_airline_clock')
    echoerr "vim-airline-clock is not loaded!"
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

" function s:ClockTicks()
"     return lh#option#Get("clock_ticks", s:clock_ticks)
" endfunction

function GetClockTick()
    let mod = (strftime('%s') % 12) + 1
    return s:clock_ticks[mod]
endfunction



function! airline#extensions#clock#timerfn(timer)
    let g:airline#extensions#clock#format = GetClockTick() . "%H:%M"
  call airline#update_statusline()
endfunction

let g:airline#extensions#clock#timer = timer_start(
      \ g:airline#extensions#clock#updatetime,
      \ 'airline#extensions#clock#timerfn',{'repeat':-1})
