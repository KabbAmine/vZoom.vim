" CREATION     : 2016-01-14
" MODIFICATION : 2016-01-31
" MAINTAINER   : Kabbaj Amine <amine.kabb@gmail.com>
" LICENSE      : MIT

" Get configuration {{{1
"	.equalise_windows => Equalise size of windows after dezooming (1)
let s:config = g:vzoom
" }}}

function! s:Zoom() abort " {{{1
	call setwinvar('%', 'vzoom', winrestcmd())
	wincmd _
	wincmd |
endfunction
function! s:Unzoom() abort " {{{1
	execute getwinvar('%', 'vzoom')
	unlet! w:vzoom
	if s:config.equalise_windows
		wincmd =
	endif
	call s:Autocmd(0)
endfunction
function! s:Autocmd(mode) abort " {{{1
	if a:mode
		augroup Vzoom
			autocmd!
			autocmd WinLeave * :call s:Unzoom()
		augroup END
	else
		if exists('#Vzoom')
			augroup Vzoom
				autocmd!
			augroup END
			augroup! Vzoom
		endif
	endif
endfunction
" }}}

function! vzoom#Toggle() abort " {{{1
	if empty(getwinvar(winnr(), 'vzoom')) && winnr('$') !=# 1
		call s:Zoom()
		call s:Autocmd(1)
	elseif exists('g:vzoom_auto')
		" Allow disabling auto-zoom if enabled
		call vzoom#AutoToggle()
	else
		call s:Unzoom()
	endif
endfunction
function! vzoom#AutoToggle() abort " {{{1
	if !exists('g:vzoom_auto')
		let g:vzoom_auto = 1
		call s:Zoom()
		augroup VzoomAuto
			autocmd!
			autocmd WinEnter * :call s:Zoom()
		augroup END
	else
		unlet! g:vzoom_auto
		call s:Unzoom()
		wincmd =
		if exists('#VzoomAuto')
			augroup VzoomAuto
				autocmd!
			augroup END
			augroup! VzoomAuto
		endif
	endif
endfunction
" }}}

" vim:ft=vim:fdm=marker:fmr={{{,}}}:
