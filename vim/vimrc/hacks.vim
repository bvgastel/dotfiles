"---------- Always show the sign (also called gutter) {{{
augroup AlwaysShowTheSign
	autocmd BufEnter * sign define dummy
	autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
augroup END
" }}}

"---------- caps-lock {{{
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
" <C-^> to toggle caps-lock
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" }}}

"---------- Silently execute external commands, without needing to redraw {{{
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'
" }}}

"---------- cmdheight {{{
function! ResizeCmdHeight()
  if &columns < 120
    set cmdheight=2
  else
    set cmdheight=1
  endif
endfunction

" neovim size is 80 when vimrc is sourced. So we need to resize on VimEnter
augroup ResizeCmdOnVimEnterOrResized
    autocmd!
    autocmd VimEnter * call ResizeCmdHeight()
    autocmd VimResized * call ResizeCmdHeight()
augroup END
" }}}
