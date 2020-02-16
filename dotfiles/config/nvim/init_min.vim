" vim-plugin {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/vim-plug')
" {{{ vim-lastplace
" https://github.com/farmergreg/vim-lastplace
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-fugitive'
" }}}
call plug#end()
" }}}
" More natural split openings
set splitbelow
set splitright
