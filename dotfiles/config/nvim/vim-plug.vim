" vim: set fdm=marker foldlevel=0:
" {{{ HOWTO
" Check status of plugins
" :PlugStatus
"
" Install all plugins listed here
" :PlugInstall
"
" Update all plugins listed here
" :PlugUpdate
"
" After updating, inspect diffs by pressing 'd' or run
" :PlugDiff
"
" Remove plugins no longer listed here
" :PlugClean
"
" Upgrade vim-plug itself
" :PlugUpgrade
" }}}
"
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
 silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" themes
Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'edkolev/tmuxline.vim'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

" Auto pairs for '(', '[', and '{'
Plug 'jiangmiao/auto-pairs'

" fancy start screen
Plug 'mhinz/vim-startify'

" file manager
Plug 'tpope/vim-vinegar'

" open focus to last place of file
Plug 'farmergreg/vim-lastplace'

" decrypt and edit gpg encrypted files
Plug 'jamessan/vim-gnupg'

" change surroundings
Plug 'tpope/vim-surround'

" commenting
Plug 'tpope/vim-commentary'

" improve repeating with .
Plug 'tpope/vim-repeat'

" show keybindings in popup
Plug 'liuchengxu/vim-which-key'

" golang
Plug 'fatih/vim-go'

" intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" auto set indent settings
Plug 'tpope/vim-sleuth'

" better syntax support
let g:polyglot_disabled = ['csv']
Plug 'sheerun/vim-polyglot'

" cool icons
Plug 'ryanoasis/vim-devicons'

" smooth scroll
Plug 'psliwka/vim-smoothie'

" show trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" async tasks Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" Snippets
Plug 'honza/vim-snippets'


" Easy Align
Plug 'junegunn/vim-easy-align'

" Graphviz
Plug 'liuchengxu/graphviz.vim'

" syntax support for JSON comments
Plug 'neoclide/jsonc.vim'

" handle unicode and digraphs characters
Plug 'chrisbra/unicode.vim'

" Run terraform fmt on save and other goodies
Plug 'hashivim/vim-terraform'


" plugs I've tried and do not like or can't figure out

" requires nvim >= 5.0
" Plug 'romgrk/barbar.nvim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \   if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|    PlugInstall --sync | q
  \|  endif
