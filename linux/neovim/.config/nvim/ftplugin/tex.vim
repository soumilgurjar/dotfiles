function! s:TexFocusVim() abort
  " Replace `TERMINAL` with the name of your terminal application
  silent execute "!open -a kitty"
  redraw!
endfunction

augroup vimtex_event_focus
  au!
  au User VimtexEventViewReverse call s:TexFocusVim()
augroup END
