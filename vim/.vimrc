"
" vimrc
" Dariusz 'sodar' Sosnowski
"

let mapleader = "," " leader key
set nocompatible

set number "show line numbers
highlight OverLength ctermbg=DarkGray ctermfg=none guibg=#592929
match OverLength /\%91v.\+/
syntax on

filetype on
filetype indent on
filetype plugin on

set splitright
set splitbelow
set nowrap
set wildmenu  " shows little menu, when tabbing on :e .vim<TAB>
set lazyredraw  " vim will redraw the window, only when needed
set showmatch  " highlight matching [{()}]

" Indentation
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType make setlocal noexpandtab shiftwidth=4 softtabstop=4
autocmd FileType mkd setlocal expandtab shiftwidth=4 softtabstop=4

" Key mappings
nmap <Leader>n :tabn<CR>
nmap <Leader>p :tabp<CR>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <C-Left> <C-w>h
noremap <C-Down> <C-w>j
noremap <C-Up> <C-w>k
noremap <C-Right> <C-w>l


"
" vim-pathogen
"
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
if v:version >= 700
  try
    execute pathogen#infect()
  catch
  endtry
endif


"
" vim-markdown
"
" cd ~/.vim/bundle && git clone https://github.com/plasticboy/vim-markdown.git
let g:vim_markdown_folding_disabled=1
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END


"
" NERDTree
"
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree.git
"
noremap <C-t> :NERDTreeToggle<CR>
inoremap <C-t> :NERDTreeToggle<CR>

"
" scratch.vim - Unobtrusive scratch window
"
" cd ~/.vim/bundle
" git clone https://github.com/mtth/scratch.vim ./scratch
"
"let g:scratch_disable = 1
let g:scratch_autohide = 1
let g:scratch_persistence_file="~/.vim-scratch"

"
" ctrlp.vim
"
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git ctrlp.vim
" # set runtimepath
" :helptags ~/.vim/bundle/ctrlp.vim/doc
"
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
