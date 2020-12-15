
" =======================================================================================
"  => Plugins
" =======================================================================================

" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'gryf/wombat256grf'

" Initialize plugin system
call plug#end()

" =======================================================================================
"  => General
" =======================================================================================

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

set noswapfile

" =======================================================================================
"  => User interface
" =======================================================================================

" Highlight search results
"set hlsearch

" =======================================================================================
" => Colors and Fonts
" =======================================================================================

" Enable syntax highlighting
syntax enable 

try
  colorscheme onedark
catch
endtry

set number
set guifont=Menlo\ Regular:h15

" =======================================================================================
" => Status line
" =======================================================================================
set laststatus=2 " Always show the status line

" Format the status line
set statusline=\ %<%F               " filename (fullpath)
set statusline+=\ %h                " indicator for help buffer
set statusline+=%m                  " modified flag
set statusline+=%r                  " readonly flag
set statusline+=%=                  " switch to the right
set statusline+=%(%l,%c%V%)         " line, column and virtual column
set statusline+=\ %3p%%             " percentage of the file

" =======================================================================================
" => Helper functions
" =======================================================================================
