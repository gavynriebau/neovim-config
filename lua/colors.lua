log("Start colors")

vim.cmd([[
" Auto-change background to be a little darker for a couple color schemes after colorscheme change
augroup MyColors
	autocmd!
	autocmd ColorScheme dracula highlight Normal ctermfg=253 ctermbg=236 guifg=#F8F8F2 guibg=#181A26
	autocmd ColorScheme onebuddy highlight Normal guifg=#abb2bf guibg=#080c14 guisp=none

	" Black hover windows
	autocmd ColorScheme * highlight NormalFloat guifg=#abb2bf guibg=#000000 guisp=none
augroup END

colorscheme onebuddy

" Diffmode colors
highlight DiffAdd cterm=NONE ctermfg=0 ctermbg=2 gui=NONE guifg=NONE guibg=#004000
highlight DiffDelete cterm=NONE ctermfg=0 ctermbg=1 gui=NONE guifg=NONE guibg=#300000
highlight DiffChange cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight DiffText cterm=NONE ctermfg=0 ctermbg=6 gui=NONE guifg=0 guibg=#000070

" Hop jump word colors
highlight HopNextKey guifg=#ff0000 gui=bold
highlight HopNextKey1 guifg=#ff00ff gui=bold
highlight HopNextKey2 guifg=#ffff00 gui=bold
]])

log("End colors")
