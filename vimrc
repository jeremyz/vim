" vimrc

" vundle
set nocompatible        " be iMproved, required
filetype off            " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" :PluginInstall :PluginUpdate
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'                  " Status/Tab line
Plugin 'vim-airline/vim-airline-themes'     " Status/Tab line Themes
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'embear/vim-localvimrc'              " .lvimrc
Plugin 'tpope/vim-commentary'               " gc[N][motion]
Plugin 'tpope/vim-surround'                 " cs'<q>
Plugin 'tpope/vim-fugitive'                 " Gstatus Gdiff Gwrite (Git add %)
Plugin 'tpope/vim-repeat'                   " allows '.' to work with plugins
Plugin 'gnupg.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'vim-scripts/taglist.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'abudden/taghighlight-automirror'
" Plugin 'jwhitley/vim-matchit'
" Plugin 'msanders/snipmate.vim'
" Plugin 'Rip-Rip/clang_complete'
" Plugin 'scrooloose/syntastic'
" Plugin 'tpope/vim-git'
" Plugin 'tpope/vim-haml'
" Plugin 'tpope/vim-markdown'
" Plugin 'vim-scripts/javacomplete'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'calviken/vim-gdscript3'


call vundle#end()            " required
filetype plugin indent on    " required


" Regular options ------------------------------------------------------------
"set spell              " spell checking
set mouse-=a            " disable automatic visual mode using mouse
set nofsync             " async I/O
set ff=unix             " file format \n
set backup              " keep a backup file
set autoindent          " use autoindent"
set nocompatible        " do not try to act like vi
set cursorline          " show cursor line
" set cursorcolumn        " show curser column
set scrolloff=5         " number of context lines above and below the cursor
set laststatus=2        " alway add status line
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set number              " show line number
set showmode            " show current mode
set colorcolumn=80      " add vertical bar
set foldmethod=marker   " define folding method

set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set backspace=indent,eol,start  " allow backspacing over everything in insert mode

" <C-r> jump to definition, <C-t> to jump back to the call
set tags+=./.tags;/
nmap <C-r> g<C-]>


" Theme ----------------------------------------------------------------------
syntax on
set hlsearch
set background=dark
if !empty($DISPLAY)
  let g:solarized_termtrans=1
endif
colorscheme solarized
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
hi CursorLineNr ctermbg=red
hi CursorLine ctermbg=0 ctermfg=None
hi ColorColumn ctermbg=7 ctermfg=None


" NonText, SpecialKey, ExtraWhitespace, ExtraOver ----------------------------
nmap <leader>l :set list!<CR>
" set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→,nbsp:␣
hi NonText ctermfg=16 guifg=#4a4a59
"hi SpecialKey ctermfg=16 guifg=#4a4a59
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\t\|\s\+$/
" highlight ExtraOver ctermbg=red ctermfg=white guibg=#59292
" match ExtraOver /\s\+\%#\@<!$\|\%81v.*/


" CtrlP ----------------------------------------------------------------------
nmap <leader>e :CtrlP<cr>
nmap <leader>ep :CtrlPBuffer<cr>
nmap <leader>em :CtrlPMixed<cr>

" Autocomplete
let g:deoplete#enable_at_startup = 1
" let g:neosnippet#disable_runtime_snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" localvimrc -----------------------------------------------------------------
let g:localvimrc_ask=0
let g:localvimrc_sandbox=0


" tagbar / taglist -----------------------------------------------------------
nmap <F2> :TagbarToggle<CR>
" nnoremap <silent> <F2> :TlistToggle<CR>
" let Tlist_Ctags_Cmd = "/usr/bin/ctags"
" let Tlist_WinWidth = 50
" let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
" let Tlist_Show_One_File = 1       " Only show tags for current buffer
" let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)

" nerdtree -------------------------------------------------------------------
nmap <F3> :NERDTreeToggle<CR>

" replace current selection with content of "" buffer
vmap p "_dP

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

 " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
  autocmd BufNewFile * :exe("0r! ~/.vim/skeletons.rb %:p " . &filetype)

endif " has("autocmd")

source ~/.vim/scripts/bepo-layout.vim

