filetype on
filetype plugin on
filetype indent on
syntax on

set nocompatible
set number
set cursorline
set cursorcolumn
set shiftwidth=4
set tabstop=4
set showmode
set showmatch
set hlsearch
set modifiable
set nowrap
set modifiable

" Para o wildmenu
set wildmenu
set wildmode=list:longest

" Plug Vim

call plug#begin('~/.vim/plugged')

  Plug 'preservim/nerdtree'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Files Templates
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
:autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html

" Config do coc.vim

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

:highlight CocFloating ctermbg=55
