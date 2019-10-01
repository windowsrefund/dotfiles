" vim: set fdm=marker foldlevel=0 :

" {{{1 Plugins
" {{{ setup
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
 silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/site/plugged')
" }}}
" {{{ open focus to last place of file
" https://github.com/farmergreg/vim-lastplace
Plug 'farmergreg/vim-lastplace'
" }}}
" {{{ theme
" https://github.com/joshdick/onedark.vim
Plug 'joshdick/onedark.vim'
let g:onedark_terminal_italics=1
let g:onedark_hide_endofbuffer=1
if &rtp =~ 'lightline'
  if empty(glob('~/.local/share/nvim/site/plugged/lightline.vim/autoload/lightline/colorscheme/onedark.vim'))
    silent !cp ~/.local/share/nvim/site/plugged/onedark.vim/autoload/lightline/colorscheme/onedark.vim ~/.local/share/nvim/site/plugged/lightline.vim/autoload/lightline/colorscheme
  endif
endif
let g:lightline = { 'colorscheme': 'onedark' }
" }}}
" {{{ statusline
Plug 'itchyny/lightline.vim'
" }}}
" {{{ file manager
" https://github.com/tpope/vim-vinegar
Plug 'tpope/vim-vinegar'
" starts with dot files hidden. Use gh to toggle this
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" }}}
" {{{ decrypt and edit gpg encrypted files
" https://github.com/jamessan/vim-gnupg
Plug 'jamessan/vim-gnupg'
let g:GPGPreferArmor=1

" }}}
" {{{ commenting
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'
" https://github.com/cbaumhardt/vim-commentary-boxed
Plug 'cbaumhardt/vim-commentary-boxed'
" }}}
" {{{ improve repeating with .
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'
" }}}
" {{{ folding for python
" https://github.com/tmhedberg/SimpylFold
Plug 'tmhedberg/SimpylFold'
" }}}
" {{{ fancy start screen
" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'
" }}}
" {{{ syntax highlighting for various languages
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'
" }}}
" {{{ better whitespace highlighting
" https://github.com/ntpeters/vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'
" }}}
" {{{ surround
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
" }}}
" {{{ Insert or delete brackets, parens, quotes, in pairs
" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMapCR=0
" }}}
" {{{ language server client
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Automatic start of language servers
let g:LanguageClient_autostart=1
" These servers must be installed 
let g:LanguageClient_serverCommands = {
	\ 'python': ['pyls'],
	\ }
" }}}
" {{{ auto completion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" github autocomplete for markdown files
Plug 'ncm2/ncm2-github'
" this is better than ncm2-tmux
" https://github.com/wellle/tmux-complete.vim
Plug 'wellle/tmux-complete.vim'

" :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" }}}
" {{{ quick run
" https://github.com/thinca/vim-quickrun
Plug 'thinca/vim-quickrun'
" }}}
" {{{
" }}}

call plug#end()
" }}}1
"
" Settings from :options {{{1
" important {{{
" }}}
" moving around, searching and patterns {{{
set ignorecase
set smartcase
set regexpengine=1
" }}}
" tags {{{
" }}}
" displaying text {{{
set number
set relativenumber
set cmdheight=2
set sidescrolloff=1 sidescroll=1
set conceallevel=2 concealcursor=nivc
set lazyredraw
set showbreak=↪
set fillchars+=diff:⣿
set fillchars+=vert:│
set fillchars+=fold:-
set listchars+=eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:⋅
set listchars+=nbsp:⋅
set listchars+=tab:\|\
" }}}
" syntax, highlighting and spelling {{{
set termguicolors guicursor=
set cursorline cursorcolumn
" }}}
" multiple windows {{{
set laststatus=2
set hidden
" }}}
" multiple tab panes {{{
" }}}
" terminal {{{
" }}}
" using the mouse {{{
set mouse=a
" }}}
" printing {{{
" }}}
" messages and info {{{
set shortmess+=c
set noshowmatch
" }}}
" selecting text {{{
" }}}
" editing text {{{
set pumheight=5
set undofile
set undodir=~/.config/nvim/undo
set undolevels=10000
set undoreload=1000
" }}}
" tabs and indenting {{{
set tabstop=2 softtabstop=2
set shiftwidth=2 textwidth=80
set smarttab expandtab
set shiftround
" }}}
" folding {{{
set foldenable
set foldcolumn=2
" }}}
" diff mode {{{
" }}}
" mapping {{{
" }}}
" reading and writing files {{{
set modeline modelines=10
set backup writebackup
set backupdir=~/.config/nvim/backup
" }}}
" the swap file {{{
set noswapfile
" }}}
" command line editing {{{
" }}}
" executing external commands {{{
" }}}
" running make and jumping to errors {{{
" }}}
" language specific {{{
" }}}
" multi-byte characters {{{
set encoding=utf-8
" }}}
" various {{{
set signcolumn=yes
" }}}
" }}}1
" Debugging help {{{
if exists('$DEBUG')
	set verbose=3
	let &verbosefile=expand('$HOME/.config/nvim/logs/runtime.log')
	let $NVIM_PYTHON_LOG_FILE=expand("$HOME/.config/nvim/logs/python.log")
endif
" }}}
" {{{1 Augroups
" {{{ all files
augroup all_files
  au!
  if &rtp =~ 'ncm2'
    au BufEnter * call ncm2#enable_for_buffer()
  endif
augroup END
" }}}
" {{{ text files
augroup text_files
  au!
  au BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == "" | set ft=text | endif
augroup END
" }}}
" {{{ python files
augroup python_files
  au!
  au BufNewFile,BufRead *.py setlocal ft=python
  au FileType python setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
        \ foldmethod=indent textwidth=79 autoindent
augroup END

" }}}
" }}}1
" {{{1 Mappings
" navigate splits the way I like
nnoremap <leader>w <c-w>
" disable highligting
nnoremap <leader><space> :noh<cr>

if &rtp =~ 'vim-commentary-boxed'
  nnoremap <leader>b :<c-u>call ToggleBox()<cr>
endif

if &rtp =~ 'vim-vinegar'
  nmap t <Plug>VinegarTabUp
else
  nmap t :echo 'Install vim-vinegar plugin'<cr>
endif

" spacebar toggles folding
nnoremap <space> za

" navigate to next/prev tab
nnoremap <c-n> gt
nnoremap <c-p> gT

" ensure we can ESC out of Insert Mode
inoremap <c-c> <esc>

" save the file using sudo
cmap w!! w !sudo tee % > /dev/null<cr>

" {{{ Popup menu
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }}}

" }}}1
" {{{1 Functions

" MyTabLine
"function! MyTabLine()
" let s = ''
" let t = tabpagenr()
" let i = 1
" while i <= tabpagenr('$')
"   let buflist = tabpagebuflist(i)
"   let winnr = tabpagewinnr(i)
"   let s .= '%' . i . 'T'
"   let s .= (i == t ? '%1*' : '%2*')
"   let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
"   let s .= i  . ': '
"    let file = bufname(buflist[winnr - 1])
"   let file = fnamemodify(file, ':p:t')
"   if file == ''
"     let file = '[No Name]'
"   endif
"   let s .= file
"   let s .= ' '
"   let i = i + 1
" endwhile
" let s .= '%T%#TabLineFill#%='
" let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
" return s
"ndfunction

" }}}1

if &rtp =~ 'onedark'
  colorscheme onedark
endif
