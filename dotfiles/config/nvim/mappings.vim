" basic key mappings

" Leader keys
let mapleader=" "

" don't use Ex mode, use Q for formatting
nnoremap Q gq

" navigate prev/next tab
nnoremap <C-n> gt
nnoremap <C-p> gT

" Yank from current cursor position to the end of the line
" (make it consistent with D, C)
nnoremap Y y$

" Do not include white space characters when using $ in visual mode
xnoremap $ g_

" Jump to matching pairs easily in normal mode
nnoremap <Tab> %

" save the file using sudo
cmap w!! w !sudo tee % > /dev/null<cr>

" better nav for omnicomplete
inoremap <expr> <c-k> ("\<C-n>")
inoremap <expr> <c-j> ("\<C-p>")

" TAB completion
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

augroup run
  autocmd! run
  autocmd FileType python nmap <buffer> <localleader>r :w<CR>:!python3 %<CR>
  autocmd FileType sh nmap <buffer> <localleader>r :w<CR>:!sh %<CR>
augroup end

