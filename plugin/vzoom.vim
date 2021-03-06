" vZoom, quickly (un)zoom the current vim window

" VERSION      : 0.3
" CREATION     : 2016-01-14
" MODIFICATION : 2016-01-29
" MAINTAINER   : Kabbaj Amine <amine.kabb@gmail.com>
" LICENSE      : MIT

" Vim options {{{1
if exists('g:vzoom_loaded')
    finish
endif
let g:vzoom_loaded = 1

" To avoid conflict problems.
let s:saveCpoptions = &cpoptions
set cpoptions&vim
" 1}}}

" Configuration {{{1
if !exists('g:vzoom')
	let g:vzoom = {}
endif
if !has_key(g:vzoom, 'equalise_windows')
	let g:vzoom.equalise_windows = 0
endif
" }}}

" One mapping {{{1
if hasmapto('<Plug>(vzoom)')
	nnoremap <unique> <script> <Plug>(vzoom) <SID>vzoom
	nnoremap <silent> <SID>vzoom :call vzoom#Toggle()<CR>
endif
" And one command {{{1
command! VZoomAutoToggle :call vzoom#AutoToggle()
" }}}

" Restore default vim options {{{1
let &cpoptions = s:saveCpoptions
unlet s:saveCpoptions
" 1}}}

" vim:ft=vim:fdm=marker:fmr={{{,}}}:
