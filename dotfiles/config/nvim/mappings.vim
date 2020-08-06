" :verbose imap <tab>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" toggle spellcheck
nnoremap <silent> <F9> :set spell!<cr>:set spell?<cr>
" c-o can be used from insert mode to execute a normal mode command
inoremap <F9> <C-O>:set spell!<cr>:set spell?<cr>

" source this config
nnoremap <leader>v :so $MYVIMRC<cr>

" edit this config
nnoremap <leader>ve :tabedit $MYVIMRC<cr>

" repeat last command line used
map <leader>r @:<CR>

" don't use Ex mode, use Q for formatting
nnoremap Q gq

" navigate splits the way I like
nnoremap <leader>w <c-w>
" resize splits faster
map <leader>> <C-w>10>
map <leader>< <C-w>10<
map <leader>= <C-w>5+
map <leader>- <C-w>5-

" disable highligting
nnoremap <leader>h :noh<cr>

" tab navigation prev/next
nnoremap <c-n> gt
nnoremap <c-p> gT

" ensure we can ESC out of Insert Mode
inoremap <c-c> <esc>

" save the file using sudo
cmap w!! w !sudo tee % > /dev/null<cr>

" sort lines in alphabetical order
vnoremap <leader>s :'<,'>!sort -f<cr>

" Quickly insert a timestamp
nnoremap <leader>t "=strftime("%F %T%z")<cr>p

" Toggle quickfix window
nnoremap <leader><leader> :call ToggleQuickfix()<cr>

