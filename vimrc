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

:imap <M-Space> <ESC>

call togglebg#map("<F5>")
" map <F12> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

" colorize extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" files
set ff=unix
set nofsync
:filetype on
:au BufNewFile * :exe("0r! ~/.vim/skeletons.rb %:p " . &filetype)
:au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

" Set color over 80 chars
au BufRead *.c,*.cpp,*.h match ExtraOver /\s\+\%#\@<!$\|\%81v.*/
highlight ExtraOver ctermbg=red ctermfg=white guibg=#59292

" indent for e17  Ref:http://trac.enlightenment.org/e/wiki/ECoding
nnoremap <silent> <F6> :set ts=8 sw=3 sts=3 expandtab cino=>5n-3f0^-2{2(0W1st0<CR>

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
set laststatus=2    " alway add status line
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set number          " show line number
set showmode        " show current mode

" nap alt-space to Esc
:imap <A-Space> <Esc>

" toggle view invisible with \t
nmap <leader>l :set list!<CR>

" remap vim-comentary : nmap \\  <Plug>Commentary
map <C-c> \\\

" Don't use Ex mode, use Q for formatting
map Q gq

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

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Completeset

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

 " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  "set tags+=~/share/ctags/efl.tags

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

