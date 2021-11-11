if &compatible
  set nocompatible  " Be iMproved
end

" Per-directory .vimrc files
set exrc
set secure

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu


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
Plug 'dense-analysis/ale'
Plug 'depuracao/vim-rdoc'
Plug 'endel/vim-github-colorscheme'
Plug 'ervandew/supertab'
Plug 'janko-m/vim-test'
Plug 'mmalecki/vim-node.js'
Plug 'nanotech/jellybeans.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pbrisbin/vim-mkdir'
Plug 'sheerun/vim-polyglot'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'sunaku/vim-ruby-minitest'
Plug 'tpope/vim-dispatch'
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
Plug 'yggdroot/indentline'
call plug#end()

" ale
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'javascript': ['remove_trailing_lines', 'trim_whitespace', 'eslint'],
      \  'ruby': ['remove_trailing_lines', 'trim_whitespace', 'standardrb'],
      \  'typescript': ['remove_trailing_lines', 'trim_whitespace', 'eslint'],
      \}
let g:ale_javascript_prettier_use_global = 1
let g:ale_javascript_prettier_options = '--print-width 120 --ruby-single-quote false'
let g:ale_fix_on_save = 1

" fzf
" show hidden files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
" use ctrl-a instead of alt-a
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" use ctrlp binding
nnoremap <c-p> :FZF<cr>

" indentline enabled
let g:indentLine_enabled = 1

" vim-markdown (vim-polyglot)
let g:vim_markdown_conceal = 0

" vim-test
let g:test#preserve_screen = 1
let test#strategy = {
      \  'nearest': 'vimterminal',
      \  'file':    'vimterminal',
      \  'suite':   'terminal',
      \}

nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>


""
"" Colors
""
colorscheme jellybeans " dark color scheme
" colorscheme github     " light color scheme

" increase font size in macvim
if has('gui_running')
  " set guifont=Monaco:h16 anti
  set guifont=RobotoMono-Regular:h16 anti
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
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


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
