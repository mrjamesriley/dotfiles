set nocompatible
syntax on
colorscheme wombat

call pathogen#runtime_append_all_bundles()

" enable filetype specific indenting and pluings  
filetype plugin indent on 

" indent settings
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set incsearch   " find the next match as we type the search
set hlsearch    " hilight searches by default

set nowrap      " dont wrap lines
set linebreak   " wrap lines at convenient points
set number      " line numbers

" who wants to reach for ESC all the time?
imap jj <Esc>

let mapleader = ','
noremap <leader>n :NERDTreeToggle<CR> 

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

