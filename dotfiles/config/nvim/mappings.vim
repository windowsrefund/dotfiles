" Leader keys
let mapleader=" "
let maplocalleader=","

" don't use Ex mode, use Q for formatting
nnoremap Q gq

" navigate prev/next tab
nnoremap <C-n> gt
nnoremap <C-p> gT

" save the file using sudo
cmap w!! w !sudo tee % > /dev/null<cr>

" Better nav for omnicomplete
inoremap <expr> <c-k> ("\<C-n>")
inoremap <expr> <c-j> ("\<C-p>")
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" navigate items in quickfix list
" map <silent> <leader>n :cnext<CR>
" map <silent> <leader>p :cprevious<CR>
" map <silent> <leader>q :cclose<CR>

" navigate prev/next/last buffer
" nnoremap <silent> <leader>n :bn<CR>
" nnoremap <silent> <leader>p :bp<CR>
" nnoremap <silent> <leader>l :b#<CR>
" nnoremap <silent> <leader>b :ls<CR>:buffer<Space>

