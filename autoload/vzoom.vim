" CREATION     : 2016-01-14
" MODIFICATION : 2016-01-14
" MAINTAINER   : Kabbaj Amine <amine.kabb@gmail.com>
" LICENSE      : MIT

function! s:Zoom(...) abort " {{{1
	call setwinvar('%', 'vzoom', winrestcmd())
	wincmd _
	wincmd |
	augroup Vzoom
		autocmd!
		autocmd WinLeave <buffer> :call s:Unzoom()
	augroup END
endfunction
function! s:Unzoom(...) abort " {{{1
	execute getwinvar('%', 'vzoom')
	unlet! w:vzoom
	if exists('#Vzoom#<buffer>')
		augroup Vzoom
			autocmd!
		augroup END
	endif
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
" }}}

function! vzoom#Toggle(...) abort " {{{1
	if empty(getwinvar(winnr(), 'vzoom')) && s:Wins() !=# 1
		call s:Zoom()
	else
		call s:Unzoom()
	endif
endfunction
" }}}

" vim:ft=vim:fdm=marker:fmr={{{,}}}:
