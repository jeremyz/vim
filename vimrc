" vimrc

call pathogen#infect()

" color scheme
" set t_Co=256
" if &t_Co >= 256 || has("gui_running")
syntax on
set hlsearch
set background=dark
if !empty($DISPLAY)
  let g:solarized_termtrans=1
  colorscheme solarized
  set listchars=tab:▸\ ,eol:¬
else
  colorscheme adobe
endif

call togglebg#map("<F5>")
" map <F12> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

" colorize extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\t\|\s\+$/

" local vimrc
let g:localvimrc_ask=0
"let g:localvimrc_sandbox=0

" ctags
nnoremap <silent> <F6> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)

" files
set ff=unix
set nofsync
:filetype on

" set list
" set cursorline
" set cursorcolumn
set foldmethod=marker
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set backspace=indent,eol,start  " allow backspacing over everything in insert mode

"set spell
if has("vms")
  set nobackupss    " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file
endif
set autoindent      " use autoindent"
set nocompatible    " do not try to act like vi
set scrolloff=5     " number of context lines above and below the cursor
set laststatus=2    " alway add status line
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set number          " show line number
set showmode        " show current mode

" toggle view invisible with \t
nmap <leader>l :set list!<CR>

" remap vim-comentary : nmap \\  <Plug>Commentary
map <C-c> \\\

" jump to definition, <C-t> to jump back to the call
nmap <C-y> g<C-]>
inoremap <C-x> <C-X><C-]>

" Don't use Ex mode, use Q for formatting
map Q gq

" to jump to a definition, <C-t> to jump back to the caller code
map <C-v> g<C-]>

" code completion
inoremap <C-d> <C-X><C-]>

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " Set color over 80 chars
  autocmd BufRead *.c,*.cpp,*.h match ExtraOver /\s\+\%#\@<!$\|\%81v.*/
  highlight ExtraOver ctermbg=red ctermfg=white guibg=#59292

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  autocmd FileType c setlocal omnifunc=ccomplete#Completeset
  autocmd Filetype java setlocal complete=.,w,b,u,t,i
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo

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

function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
    endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>
" autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

source ~/.vim/scripts/bepo-layout.vim

