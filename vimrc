" vimrc

call pathogen#infect()

" color scheme
map <F12> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>
if !empty($DISPLAY)
  set t_Co=256
  colorscheme desert256
else
  colorscheme adobe
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" colorize extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" files
set ff=unix
set nofsync
:filetype on
:au BufNewFile * :exe("0r! ~/.vim/skeletons.rb %:p " . &filetype)
:au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

" set cursorline
" set cursorcolumn
set foldmethod=marker
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set backspace=indent,eol,start  " allow backspacing over everything in insert mode

"set spell
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set autoindent      " use autoindent"
set nocompatible    " do not try to act like vi
set laststatus=2    " alway add status line
set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set number          " show line number
set showmode        " show current mode


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

source ~/.vim/scripts/bepo-layout.vim

