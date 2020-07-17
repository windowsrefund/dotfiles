" vim: set fdm=marker foldlevel=0:
let mapleader = ","

" {{{ Plugins
" {{{ setup
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
 silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/site/plugged')
" }}}
" {{{ theme
" https://github.com/dylanaraps/wal.vim
Plug 'dylanaraps/wal.vim'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'edkolev/tmuxline.vim'
" }}}
" {{{ fancy start screen
" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'
" }}}
" {{{ file manager
" https://github.com/tpope/vim-vinegar
Plug 'tpope/vim-vinegar'
nmap t <Plug>VinegarTabUp
" starts with dot files hidden. Use gh to toggle this
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" }}}
" {{{ open focus to last place of file
" https://github.com/farmergreg/vim-lastplace
Plug 'farmergreg/vim-lastplace'
" }}}
" {{{ decrypt and edit gpg encrypted files
" https://github.com/jamessan/vim-gnupg
Plug 'jamessan/vim-gnupg'
" let g:GPGPreferArmor=1

" }}}
" {{{ commenting
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'
" }}}
" {{{ improve repeating with .
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'
" }}}
" {{{ show keybindings in popup
" https://github.com/liuchengxu/vim-which-key
Plug 'liuchengxu/vim-which-key'
" }}}
" {{{ https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" }}}

call plug#end()
" }}}
" Settings from :options {{{
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
" help fo-table for definitions of options
set formatoptions=qrnj1c
set number
set relativenumber
set cmdheight=2
set sidescrolloff=1 sidescroll=1
set concealcursor=nivc
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
" next line makes wal.vim plugin work
set notermguicolors
set guicursor=
set nocursorline
set nocursorcolumn
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
set mouse=
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
set textwidth=80
set tabstop=2
" Indentation amount for < and > commands
set shiftwidth=2
" Insert spaces when TAB is pressed.
set expandtab
" Number of spaces TAB counts for in Insert mode
set softtabstop=2
" Round indent to multiple of shiftwidth. Used for < and >
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
" Some LSP servers have issues with backup files
" See https://github.com/neoclide/coc.nvim/issues/649
set nobackup
set nowritebackup
" }}}
" the swap file {{{
set noswapfile
" coc.nvim suggests this over default 4000
set updatetime=300
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
" always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
if has("patch-8.1.1564")
  " recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" }}}
" }}}
" Augroups {{{
augroup all_files
  au!
    " disables automatic commenting on new line
    au FileType * setlocal formatoptions-=cor
    " automatically deletes all trailing whitespace on save
    au BufWritePre * %s/\s\+$//e
augroup END
augroup text_files
  au!
  au BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == "" | set ft=text | endif
augroup END
" https://github.com/thinca/vim-quickrun/issues/177
augroup QuickRunTerminalOutputBuffer
  au!
  au CursorMoved *
  \ if &buftype ==# 'terminal' |
  \   setl nornu nonu nocuc nocul fdc=0 |
  \ endif
  augroup END
" quick-scope plugin
augroup qs_colors
  au!
  au ColorScheme * highlight QuickScopePrimary gui=underline ctermfg=112
  au ColorScheme * highlight QuickScopeSecondary gui=underline ctermfg=110
augroup END"
augroup xresources
  au!
  " run xrdb whenever Xdefaults or Xresources are updated
  au BufWritePost *Xresources, *Xdefaults !xrdb %
augroup END"

" }}}
" Mappings {{{
" :verbose imap <tab>
"
" toggle spellcheck
nnoremap <silent> <F9> :set spell!<cr>:set spell?<cr>
" c-o can be used from insert mode to execute a normal mode command
inoremap <F9> <C-O>:set spell!<cr>:set spell?<cr>

" shorten leader timeout from default of 1000
set timeoutlen=500

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

" }}}
" {{{ Functions

function! ToggleQuickfix()
  for buffer in tabpagebuflist()
    if bufname(buffer) == ''
      " then it has to be the quickfix window
      cclose
      return
    endif
  endfor

  copen
endfunction

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
"endfunction

" }}}
" Themes {{{
let g:lightline = {
  \ 'colorscheme': 'wal',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \ },
  \ }"}}}

source $HOME/.config/nvim/coc.vim
colorscheme wal
