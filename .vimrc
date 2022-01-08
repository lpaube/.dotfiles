"Vim-plug install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Vim-plug plugins
call plug#begin('~/.vim/plugged')
    Plug 'gruvbox-community/gruvbox'
    Plug 'vimwiki/vimwiki'
call plug#end()

"Generic settings
set nocompatible
filetype plugin on

set number
set ruler
syntax enable
set nowrap
set hlsearch
set showcmd "To see number of cols or rows
set wildmenu
    
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
filetype plugin indent on
set hidden "Allows unsaved buffer to not be shown in window
set foldmethod=syntax

"Colors
set termguicolors
set background=dark
let g:everforest_background = 'medium'
let g:gruvbox_contrast_dark = 'medium'
colo gruvbox

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


packadd! termdebug

"Maximize window or return to initial layout
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

"Vimspector
let g:vimspector_enable_mappings = 'HUMAN'


"set notermguicolors
