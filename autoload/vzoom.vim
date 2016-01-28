" CREATION     : 2016-01-14
" MODIFICATION : 2016-01-29
" MAINTAINER   : Kabbaj Amine <amine.kabb@gmail.com>
" LICENSE      : MIT

function! s:Zoom() abort " {{{1
	call setwinvar('%', 'vzoom', winrestcmd())
	wincmd _
	wincmd |
endfunction
function! s:Unzoom() abort " {{{1
	execute getwinvar('%', 'vzoom')
	unlet! w:vzoom
endfunction
function! s:Wins() abort " {{{1
	" Return number of windows in current tab

	let l:cw = winnr()
	let l:wins = 1
	wincmd w
	while winnr() !=# l:cw
		let l:wins += 1
		wincmd w
	endwhile
	execute l:cw . 'wincmd w'
	return l:wins
endfunction
function! s:Augroup(mode) abort " {{{1
	" Enable/Disable augroup Vzoom when mode is 1/0

	if a:mode
		augroup Vzoom
			autocmd!
			autocmd WinLeave <buffer> :call s:Unzoom()
		augroup END
	else
		if exists('#Vzoom#<buffer>')
			augroup Vzoom
				autocmd!
			augroup END
		endif
	endif
endfunction
" }}}

function! vzoom#Toggle() abort " {{{1
	if empty(getwinvar(winnr(), 'vzoom')) && s:Wins() !=# 1
		call s:Zoom()
		call s:Augroup(1)
	elseif exists('g:vzoom_auto')
		call vzoom#AutoToggle()
		call s:Augroup(0)
	else
		call s:Unzoom()
		call s:Augroup(0)
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
		endif
	endif
endfunction
" }}}

" vim:ft=vim:fdm=marker:fmr={{{,}}}:
