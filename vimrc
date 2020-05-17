if &compatible
  set nocompatible  " Be iMproved
end


""
"" Plugins
""
" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins
call plug#begin('~/.vim/bundle')
Plug 'ap/vim-css-color'
Plug 'chrisbra/csv.vim'
Plug 'depuracao/vim-rdoc'
Plug 'ervandew/supertab'
Plug 'janko-m/vim-test'
Plug 'mmalecki/vim-node.js'
Plug 'nanotech/jellybeans.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pbrisbin/vim-mkdir'
Plug 'sheerun/vim-polyglot'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'sunaku/vim-ruby-minitest'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/tComment'
Plug 'vim-syntastic/syntastic'
call plug#end()

" fzf with ctrlp binding
nnoremap <c-p> :FZF<cr>

" vim-test strategy
let test#strategy = {
  \ 'nearest': 'vimterminal',
  \ 'file':    'vimterminal',
  \ 'suite':   'terminal',
\}


""
"" Colors
""
color jellybeans

" increase font size in macvim
if has('gui_running')
  set guifont=Monaco:h14 noanti
endif

""
"" Spaces & Tabs
""
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2    " an autoindent (with <<) is two spaces
set list            " show invisible characters


""
"" UI Config
""
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set nowrap              " don't wrap lines

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Make netrw work like NERDTree
let g:netrw_banner = 0
let g:netrw_liststyle = 3


""
"" Searching
""
set hlsearch            " highlight matches
set ignorecase          " searches are case insensitive...
set smartcase           " ... unless they contain at least one capital letter


""
"" Leader Shortcuts
""
let mapleader='\'       " leader is backslash

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>


""
"" Backup, Swap, & Undo
""
set backup            " enable backup files
set backupdir=/tmp//  " where to store backup files
set writebackup       " make backup before overwriting the current buffer
set backupcopy=yes    " Overwrite the original backup file

set swapfile          " enable swap files
set directory=/tmp//  " where to store swap files

set undofile          " enable undo files
set undodir=/tmp//    " where to store undo files