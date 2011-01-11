set nocompatible
:colorscheme wombat
syntax on

set hidden
set number
set softtabstop=2
set autoindent
set copyindent
set expandtab
set showmode
set incsearch
set hlsearch
set guioptions-=T
set ignorecase
set guifont=Monospace\ 9 

" load ftplugins and indent files
filetype plugin on
"filetype indent on

" Get out of my face swap files
set backupdir=$HOME/.swp//
set directory=$HOME/.swp//


" make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" shortcut to esc
imap jj <Esc>

let mapleader = ','
noremap <leader>n :NERDTreeToggle<CR>

" lazy shortcut to enter command mode
nmap ; :

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
