" Vim plugins installed with Pathogen and Git Submodules, as described here:
" http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

set nocompatible
:colorscheme wombat

set exrc " enable per-directory vimrc files
set secure " disable unsafe commands in local .vimrc files

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
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\.DS_Store']

au BufNewFile,BufRead *.watchr set filetype=ruby
au BufNewFile,BufRead *.ru     set filetype=ruby
au BufNewFile,BufRead *.coffee set filetype=coffee

call pathogen#infect()
syntax on
filetype plugin indent on

let mapleader = ','

" Get out of my face swap files
set backupdir=$HOME/.swp//
set directory=$HOME/.swp//

" Turn off Backup/Swap files completely, we have VCS
set nobackup
set noswapfile

" make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>
nnoremap <leader>s :Ack -Q '

" resize all windows to be equal width and height
nnoremap <leader>w <C-w>=

" insert a new line after the current line
nnoremap <Enter> o<Esc>k

" easier bufferage
nnoremap <leader>b :BufExplorer

" shortcut to esc
imap jj <Esc>

" easier window splitting
nnoremap <D-d> :split<cr>
nnoremap <D-r> :vsplit<cr>

" quick edit vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>rv :so $MYVIMRC<cr>:echo "VIMRC reloaded..."<cr>

" quick access to Vim help pages
nnoremap <leader>fl :help function-list<cr>

" execute ruby from within vim
imap <leader>rr <Esc>:!ruby %<cr>
nmap <leader>rr :!ruby %<cr>

noremap <leader>n :NERDTreeToggle<CR>
noremap <leader><tab> :tabnext<CR>

noremap <leader>csr :CoffeeRun<CR>
noremap <leader>csc :CoffeeCompile<CR>

" from old Ruby hash rocket to new hash
nmap <leader>hr :%s/:\([^=,'"]*\) =>/\1:/g<cr>
vmap <leader>hr :s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>

" trigger babeljs compilation of current file
nnoremap <leader>b :!babel %<cr>

" cycle through windows with command-w
noremap <D-]> <C-w>w
noremap <D-[> <C-w>W

" close all windows except the current
noremap <leader>o :only<cr>

" cycle through tabs with cmd-9 and cmd-0
noremap <D-0> :tabnext<CR>
noremap <D-9> :tabprev<CR>

" for quickly adding focus true for an rspec
noremap <leader>ff :s/" do/", focus: true do<CR>

" convert old-school hash rockets to new school hash syntax
nmap <leader>h :s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>
vmap <leader>h :'<,'>s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

set laststatus=2
set statusline=%f\ -\ %y

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  if &ft =~ 'markdown'
    return
  endif

  " preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")

  " so the business:
  %s/\s\+$//e

  " clean up by restoring previous search history, and cursor position:
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
autocmd BufNewFile,BufReadPost *.json set filetype=javascript

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$\|node_modules$\|vendor$\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" common typos / abbreviations automatically corrected
:iabbrev tempalte template
:iabbrev fn function

highlight ColorColumn term=reverse ctermbg=233 guibg=#1E2733
set colorcolumn=120

