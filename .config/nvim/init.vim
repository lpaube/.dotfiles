"Add .vimrc to neovim configs
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin('~/.vim/plugged')
	Plug 'neovim/nvim-lspconfig'
call plug#end()
