" Leader key
let mapleader=" "
nnoremap <Space> <Nop>

" don't use Ex mode, use Q for formatting
nnoremap Q gq

" navigate splits
nnoremap <leader>w <c-w>

" resize splits faster
map <leader>> <C-w>5>
map <leader>< <C-w>5<
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

if exists('g:vscode')

  " Simulate same TAB behavior in VSCode
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>

else

  " Better nav for omnicomplete
  inoremap <expr> <c-j> ("\<C-n>")
  inoremap <expr> <c-k>("\<C-p>")

  " TAB completion
  inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
endif

