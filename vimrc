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
set guioptions-=T " hide toolbar
set ignorecase
" set guifont=Inconsolata:h14
set guifont=Monaco:h10
set splitbelow
set splitright

" word wrap without breaking at middle of word
set formatoptions=l
set lbr

let NERDTreeShowHidden=1
au BufNewFile,BufRead *.watchr set filetype=ruby
au BufNewFile,BufRead *.ru     set filetype=ruby
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

noremap <leader>csr :CoffeeRun<CR>
noremap <leader>csc :CoffeeCompile<CR>

" cycle through windows with command-w
noremap <D-]> <C-w>w

" cycle through tabs with cmd-9 and cmd-0
noremap <D-0> :tabnext<CR>
noremap <D-9> :tabprev<CR>

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
