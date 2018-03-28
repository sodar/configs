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

colorscheme ron

"filetype on
"filetype plugin on

set splitright
set splitbelow
set nowrap
set wildmenu  " shows little menu, when tabbing on :e .vim<TAB>
set lazyredraw  " vim will redraw the window, only when needed
set showmatch  " highlight matching [{()}]

" Indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType go setlocal noexpandtab shiftwidth=4 softtabstop=4
autocmd FileType make setlocal noexpandtab shiftwidth=4 softtabstop=4
autocmd FileType markdown setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2

" Highlight tabs as '>---', highlight trailing spaces
set listchars=tab:>-,trail:-
set list
highlight SpecialKey ctermfg=DarkGray

" Key mappings
nmap    <Leader>n   :tabn<CR>
nmap    <Leader>p   :tabp<CR>

map     <f9>        :make

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <C-Left> <C-w>h
noremap <C-Down> <C-w>j
noremap <C-Up> <C-w>k
noremap <C-Right> <C-w>l

"
" Promela syntax highlightinh
"
augroup filetypedetect
    au BufNewFile,BufRead *.promela,*.prm   setf promela
augroup END


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
" NERDTree
"
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree.git
"
noremap <C-t> :NERDTreeToggle<CR>
inoremap <C-t> :NERDTreeToggle<CR>

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
