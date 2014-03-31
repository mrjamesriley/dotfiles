set nocompatible
:colorscheme wombat
syntax on

set exrc " enable per-directory vimrc files
set secure " disable unsafe commands in local .vimrc files

set hidden
set number
set softtabstop=2
set shiftwidth=2
set autoindent
" set cursorline
set copyindent
set expandtab
set showmode
set incsearch
set hlsearch
set guioptions-=T " hide toolbar
set smartcase

set noantialias
set guifont=Monaco:h10

set splitbelow
set splitright

" word wrap without breaking at middle of word
set formatoptions=l
set lbr

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

let NERDTreeShowHidden=1

au BufNewFile,BufRead *.watchr set filetype=ruby
au BufNewFile,BufRead *.ru     set filetype=ruby
au BufNewFile,BufRead *.coffee set filetype=coffee

call pathogen#incubate()
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
nnoremap <leader>s :Ack '

" insert a new line after the current line
nnoremap <Enter> o<Esc>k

" easier bufferage
nnoremap <leader>b :BufExplorer

" shortcut to esc
imap jj <Esc>

" execute ruby from within vim
imap <leader>rr <Esc>:!ruby %<cr>
nmap <leader>rr :!ruby %<cr>

noremap <leader>n :NERDTreeToggle<CR>
noremap <leader><tab> :tabnext<CR>

noremap <leader>csr :CoffeeRun<CR>
noremap <leader>csc :CoffeeCompile<CR>

" to winning old hash rocket to new hash
nmap <Leader>hr :%s/:\([^=,'"]*\) =>/\1:/g<cr>
vmap <Leader>hr :s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>

" cycle through windows with command-w
noremap <D-]> <C-w>w

" cycle through tabs with cmd-9 and cmd-0
noremap <D-0> :tabnext<CR>
noremap <D-9> :tabprev<CR>

" for quickly adding focus true for an rspec
noremap <leader>ff :s/" do/", focus: true do<CR>

" convert old-school hash rockets to new school hash syntax
nmap <Leader>h :s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>
vmap <Leader>h :'<,'>s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>

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

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" have Vim watch the vimrc and reload if auto reload to pick up changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" want ctrlp to be able to replace the nerdTree window
" https://github.com/kien/ctrlp.vim/issues/78
let g:ctrlp_reuse_window = 'NERD_tree_1'

" Hamlbars uses HAML syntax
autocmd BufNewFile,BufReadPost *.hamlbars set filetype=haml
autocmd BufNewFile,BufReadPost *.hbs set filetype=haml
