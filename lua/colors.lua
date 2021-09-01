log("Start colors")

vim.cmd([[
colorscheme base16-chalk

" Black background
"highlight Normal guibg=#000000

" Diffmode colors
highlight DiffAdd cterm=NONE ctermfg=0 ctermbg=2 gui=NONE guifg=NONE guibg=#004000
highlight DiffDelete cterm=NONE ctermfg=0 ctermbg=1 gui=NONE guifg=NONE guibg=#300000
highlight DiffChange cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight DiffText cterm=NONE ctermfg=0 ctermbg=6 gui=NONE guifg=0 guibg=#000080

" Hop jump word colors
highlight HopNextKey guifg=#ff0000 gui=bold
highlight HopNextKey1 guifg=#ff00ff gui=bold
highlight HopNextKey2 guifg=#ffff00 gui=bold
]])

log("End colors")
