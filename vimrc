set nocompatible
:colorscheme wombat
syntax on

set hidden
set number
set softtabstop=2
set shiftwidth=2
set autoindent
set copyindent
set expandtab
set showmode
set incsearch
set hlsearch
set guioptions-=T
set ignorecase
set guifont=Monaco:h10
set splitbelow
set splitright
let NERDTreeShowHidden=1
au BufNewFile,BufRead *.watchr set filetype=ruby
au BufNewFile,BufRead *.coffee set filetype=coffee

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
let mapleader = ','

" load ftplugins and indent files
filetype plugin on
filetype indent on

" Get out of my face swap files
set backupdir=$HOME/.swp//
set directory=$HOME/.swp//

" make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" insert a new line after the current line
nnoremap <Enter> o<Esc>k

" easier bufferage
nnoremap <leader>b :BufExplorer

" shortcut to esc
imap jj <Esc>

noremap <leader>n :NERDTreeToggle<CR>
noremap <leader><tab> :tabnext<CR>
noremap <leader>w <C-w>w

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

set laststatus=2
set statusline=%f
