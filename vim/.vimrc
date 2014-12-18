"
" vimrc
" Dariusz 'sodar' Sosnowski
"

let mapleader = "," " leader key

set number "show line numbers
highlight ColorColumn ctermbg=DarkGray
set colorcolumn=80
syntax on

set splitright
set splitbelow

" Indentation
set expandtab
set tabstop=4
set softtabstop=2
set shiftwidth=2
set autoindent

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


"
" NERDTree
"
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree.git
"
noremap <C-t> :NERDTreeToggle<CR>
inoremap <C-t> :NERDTreeToggle<CR>

