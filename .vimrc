" custom vim settings

" set utf-8 as the default encoding
set encoding=utf-8
" enable syntax highlighting
syntax on
" use visual bell instead of beeping when doing something wrong
set visualbell
" display line numbers on the left
set number
" change the number of space characters inserted for indentation
set shiftwidth=2
" display 4 spaces on the screen wherever there is a tab character
set tabstop=2
" enable incremental search
set incsearch
" disable case-sensitivity
set ignorecase
" enable smart case
set smartcase
" enable highlighting of all text matching current search term
set hlsearch
" This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>
" be iMproved, required
set nocompatible                               
" required
filetype off 
" theme
colorscheme torte
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" keep plugin commands between vundle#begin/end.
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'preservim/nerdtree'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()

filetype plugin indent on    " required

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" enable autoformat for YCM
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" map YCM auto fix to F9
map <F9> :YcmCompleter FixIt<CR>
" map NERDTree Toggle to F5
map <F5> :NERDTreeToggle<CR>
