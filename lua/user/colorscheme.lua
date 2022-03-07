
vim.cmd[[
" colorscheme solarized
" let g:solarized_termtrans=1
colorscheme darkplus
hi CursorLineNr guibg=#8a4a59
hi CursorLine guibg=#3a3a3a
hi ColorColumn guibg=#3a3a3a
hi Search guibg=peru guifg=wheat
hi NonText ctermfg=16 guifg=#4a4a59
hi ExtraWhitespace ctermbg=red guibg=red ctermfg=black guifg=black
match ExtraWhitespace /\s\+$/
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→,nbsp:␣
hi Normal guibg=none                                                     " transparent bg
let g:airline_theme='wombat'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_idx_mode = 1
]]

