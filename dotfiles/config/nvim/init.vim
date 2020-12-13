" general settings
source $HOME/.config/nvim/vim-plug.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim

" themes
source $HOME/.config/nvim/plug-config/wal.vim
source $HOME/.config/nvim/plug-config/lightline.vim

" plugin configs
source $HOME/.config/nvim/plug-config/better-whitespace.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/graphviz.vim
source $HOME/.config/nvim/plug-config/polyglot.vim
source $HOME/.config/nvim/plug-config/vim-go.vim
source $HOME/.config/nvim/plug-config/vim-vinegar.vim
source $HOME/.config/nvim/plug-config/vim-terraform.vim
source $HOME/.config/nvim/plug-config/which-key.vim

au BufWinEnter *.py nnoremap <leader>r :w<CR>:!python3 %<CR>
au BufWinEnter *.sh nnoremap <leader>r :w<CR>:!sh %<CR>

