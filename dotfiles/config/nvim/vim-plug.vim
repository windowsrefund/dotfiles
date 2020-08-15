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
Plug 'sprockmonty/wal.vim'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'edkolev/tmuxline.vim'

" Markdown Preview
" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }

" Auto pairs for '(', '[', and '{'
" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

" fancy start screen
" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" file manager
" https://github.com/tpope/vim-vinegar
Plug 'tpope/vim-vinegar'
nmap t <Plug>VinegarTabUp
" starts with dot files hidden. Use gh to toggle this
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" open focus to last place of file
" https://github.com/farmergreg/vim-lastplace
Plug 'farmergreg/vim-lastplace'

" decrypt and edit gpg encrypted files
" https://github.com/jamessan/vim-gnupg
Plug 'jamessan/vim-gnupg'
" let g:GPGPreferArmor=1

" commenting
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" improve repeating with .
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" show keybindings in popup
" https://github.com/liuchengxu/vim-which-key
Plug 'liuchengxu/vim-which-key'

" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax highlighting for JSONC
" https://github.com/kevinoid/vim-jsonc
Plug 'kevinoid/vim-jsonc'

" Snippets
" https://github.com/honza/vim-snippets
Plug 'honza/vim-snippets'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \   if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|    PlugInstall --sync | q
  \|  endif
