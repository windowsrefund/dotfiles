" vim: fdm=marker foldlevel=0
let mapleader = ","

" Plugins {{{
" setup {{{
if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
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
" }}}
" {{{ fancy start screen
" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'
" }}}
" {{{ file manager
" https://github.com/tpope/vim-vinegar
Plug 'tpope/vim-vinegar'
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
" https://github.com/cbaumhardt/vim-commentary-boxed
" Plug 'cbaumhardt/vim-commentary-boxed'
" }}}
" {{{ improve repeating with .
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'
" }}}
" {{{ better whitespace highlighting
" https://github.com/ntpeters/vim-better-whitespace
Plug 'ntpeters/vim-better-whitespace'
" }}}
" {{{ surround
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
" }}}
" {{{ auto pairs
" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode=0
let g:AutoPairsMapCR=0
" }}}
" {{{ quick run
" https://github.com/thinca/vim-quickrun
Plug 'thinca/vim-quickrun'
let g:quickrun_config = {
\ '_': {
\   'outputter/buffer/close_on_empty': 1
\ }
\ }
" }}}
" {{{ easy align
" https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" }}}
" {{{ git integration plugins
" https://github.com/jreybert/vimagit
Plug 'jreybert/vimagit'
" }}}
" {{{ show keybindings in popup
" https://github.com/liuchengxu/vim-which-key
Plug 'liuchengxu/vim-which-key'
" }}}
" {{{ python folding
" https://github.com/tmhedberg/SimpylFold
" 2019-10-07: Not folding defs correctly and not folding class at all
" Plug 'tmhedberg/simpylfold'
" https://github.com/kalekundert/vim-coiled-snake
Plug 'kalekundert/vim-coiled-snake'
Plug 'konfekt/fastfold'
" }}}
" {{{ autocomplete with deoplete
" https://github.com/Shougo/deoplete.nvim
" pip install pynvim jedi
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}
let g:deoplete#sources#syntax#min_keyword_length = 2
au InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
Plug 'zchee/deoplete-jedi'
" better than using the preview window
Plug 'ncm2/float-preview.nvim'
set pumheight=10
set completeopt=longest,menu
" }}}
" {{{ syntax highlighting for Salt files
" https://github.com/saltstack/salt-vim
Plug 'saltstack/salt-vim'
" }}}
" {{{ code-jump and more with jedi-vim
" https://github.com/davidhalter/jedi-vim
Plug 'davidhalter/jedi-vim'
" disable autocomplete
let g:jedi#completions_enabled = 0
" do not allow jedi-vim to autoconfigure options
let g:jedi#auto_vim_configuration = 0
"
" }}}
" {{{ snippets with UltiSnips
" https://github.com/sirver/UltiSnips
" the engine
Plug 'sirver/UltiSnips'
" the snippets
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
" inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-n>"
" let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" }}}
" {{{ Tame the quickfix window
" https://github.com/romainl/vim-qf
Plug 'romainl/vim-qf'
" }}}
" fast left-right movement{{{
" https://github.com/unblevable/quick-scope
Plug 'unblevable/quick-scope'
"}}}
" center the text{{{
Plug 'junegunn/goyo.vim'
"}}}
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
" set cursorline
" set cursorcolumn
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
" More natural split openings
set splitbelow
set splitright
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
set signcolumn=auto:2
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
" shorten leader timeout from default of 1000
set timeoutlen=500

" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set bg=dark \| set linebreak<CR>

" repeat last command line used
map <leader>r @:<CR>

" toggle spellcheck
map <leader>o :set spell! spelllang=en_us<CR>
" check file in spellcheck
map <leader>s :!clear && spellcheck %<CR>

" edit config in a tab
map <leader>v :tabedit $MYVIMRC<CR>

" don't use Ex mode, use Q for formatting
map Q gq

" navigate splits the way I like
map <leader>w <c-w><c-w>

" disable highligting
map <leader>h :noh<cr>

" tab navigation prev/next
map <c-n> gt
map <c-p> gT

" ensure we can ESC out of Insert Mode
imap <c-c> <esc>

" save the file using sudo
cmap w!! w !sudo tee % > /dev/null<cr>

" sort lines in alphabetical order
vnoremap <leader>a :'<,'>!sort -f<cr>

" Quickly insert a timestamp
nnoremap <leader>t "=strftime("%F %T%z")<cr>p

" Toggle quickfix window
nnoremap <leader><leader> :call ToggleQuickfix()<cr>

nnoremap <silent> K :call <SID>show_documentation()<cr>

" resize splits faster
map <leader>> <C-w>10>
map <leader>< <C-w>10<
map <leader>= <C-w>5+
map <leader>- <C-w>5-
" }}}
" Plugin-specific mappings {{{
" if &rtp =~ 'jedi-vim'
"   let g:jedi#rename_command = '<leader>rn'
" endif
"   let g:which_key_vertical=0
"   nnoremap <silent> <leader> :<c-u>WhichKey '\'<cr>
"   nnoremap <silent> <leader>? :<c-u>WhichKey 'g'<cr>
" endif

" if &rtp =~ 'vim-better-whitespace'
"   nnoremap <leader>s :StripWhitespace<cr>
" else
"   nnoremap <leader>s :echo 'Install vim-better-whitespace'<cr>
" endif

" if &rtp =~ 'vim-easy-align'
"   " Start interactive EasyAlign in visual mode (e.g. vipga)
"   xnoremap <leader>e <Plug>(EasyAlign)
"   " Start interactive EasyAlign for a motion/text object (e.g. gaip)
"   nnoremap <leader>e <Plug>(EasyAlign)
" else
"   nnoremap <leader>e :echo 'Install vim-easy-align'<cr>
" endif

if &rtp =~ 'vim-vinegar'
  nmap t <Plug>VinegarTabUp
else
  nnoremap t :echo 'Install vim-vinegar plugin'<cr>
endif
" }}}
" Functions{{{

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    if &rtp =~ 'coc\.nvim'
      call CocAction('doHover')
    endif
  endif
endfunction

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
" themes{{{
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
colorscheme wal
