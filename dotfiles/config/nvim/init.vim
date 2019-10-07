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
" {{{ nord theme
" " https://github.com/arcticicestudio/nord-vim
Plug 'arcticicestudio/nord-vim'
let g:nord_uniform_diff_background=1
let g:nord_italic_comments=1
" good with markdown
let g:nord_bold=1
let g:nord_italic=1
let g:nord_underline=1
if &rtp =~ 'lightline'
  if empty(glob('~/.local/share/nvim/site/plugged/lightline.vim/autoload/lightline/colorscheme/nord.vim'))
    silent !cp ~/.local/share/nvim/site/plugged/nord.vim/autoload/lightline/colorscheme/nord.vim ~/.local/share/nvim/site/plugged/lightline.vim/autoload/lightline/colorscheme
  endif
endif
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction'
  \ },
  \ }
" }}}
" {{{ statusline
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
Plug 'cbaumhardt/vim-commentary-boxed'
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
let g:AutoPairsFlyMode=1
let g:AutoPairsMapCR=0
" }}}
" {{{ auto completion
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" github autocomplete for markdown files
Plug 'ncm2/ncm2-github'
" https://github.com/wellle/tmux-complete.vim
Plug 'wellle/tmux-complete.vim'
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" set completeopt=noinsert,menuone,noselect,preview
" }}}
" {{{ snippets
" https://github.com/honza/vim-snippets
Plug 'honza/vim-snippets'
" }}}
" {{{ quick run
" https://github.com/thinca/vim-quickrun
Plug 'thinca/vim-quickrun'
" }}}
" {{{ easy align
" https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" }}}
" {{{ git integration plugins
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
" https://github.com/tpope/vim-rhubarb
Plug 'tpope/vim-rhubarb'
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
" {{{
" }}}

call plug#end()
" }}}1

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
set signcolumn=auto:2
" }}}
" }}}1
" {{{1 Augroups
" {{{ all files
" augroup all_files
"   au!
" augroup END
" }}}
" {{{ text files
augroup text_files
  au!
  au BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == "" | set ft=text | endif
augroup END
" }}}
" {{{ python files
" augroup python_files
"   au!
"   au BufNewFile,BufRead *.py setlocal ft=python
"   au FileType python setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
"         \ foldmethod=indent textwidth=79
" augroup END

" }}}
" {{{ json files
" Correct comment highligting for :CocConfig
" augroup json_files
"   au!
"   au FileType json syntax match Comment +\/\/.\+$+
" augroup END
" }}}
" }}}1
" {{{1 Mappings
" :verbose imap <tab>
" {{{ Popup menu
if &rtp =~ 'coc\.nvim'
  " The only working solution I've found is here
  " https://github.com/neoclide/coc.nvim/issues/606

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  inoremap <silent><expr> <S-Tab>
        \ pumvisible() ? "\<C-p>" :
        \ <SID>check_back_space() ? "\<S-Tab>" :
        \ coc#refresh()

  " Use <cr> to confirm completion, '<c-g>u means break undo chain at current
  " position'
  inoremap <silent><expr> <CR>
        \ pumvisible() ? "\<C-y>" :
        \ "\<C-g>u\<CR>"

  let g:coc_snippet_next = '<Tab>'
  let g:coc_snippet_prev = '<S-Tab>'

  " remap for gotos
  "
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " rename current word
  nnoremap <leader>n <Plug>(coc-rename)

  " format selected region
  xmap <leader>q <Plug>(coc-format-selected)
  nmap <leader>q <Plug>(coc-format-selected)
else
  " Use <CR> to confirm completion
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " Use <TAB> and <S-Tab> to navigate the completion list
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " Use <TAB> in normal and visual modes to navigate selection ranges
  " needs server support, like: coc-python
  " nmap <silent> <Tab> <Plug>(coc-range-select)
  " xmap <silent> <Tab> <Plug>(coc-range-select)
  " xmap <silent> <S-Tab> <Plug>(coc-range-select-backward)
  " nnomap <Tab> <shift>[
endif

" }}}
" {{{ Plugin-specific mappings
if &rtp =~ 'vim-which-key'
  let g:which_key_vertical=0
  nnoremap <silent> <leader> :<c-u>WhichKey '\'<cr>
  nnoremap <silent> <leader>g :<c-u>WhichKey 'g'<cr>
endif

if &rtp =~ 'vim-better-whitespace'
  nnoremap <leader>s :StripWhitespace<cr>
else
  nnoremap <leader>s :echo 'Install vim-better-whitespace'<cr>
endif

if &rtp =~ 'vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xnoremap <leader>e <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nnoremap <leader>e <Plug>(EasyAlign)
else
  nnoremap <leader>e :echo 'Install vim-easy-align'<cr>
endif

if &rtp =~ 'vim-commentary-boxed'
  nnoremap <leader>b :<c-u>call ToggleBox()<cr>
else
  nnoremap <leader>b :echo 'Install vim-commentary-boxed'<cr>
endif

if &rtp =~ 'vim-vinegar'
  nmap t <Plug>VinegarTabUp
else
  nnoremap t :echo 'Install vim-vinegar plugin'<cr>
endif

" }}}
" {{{ Others
" shorten leader timeout from default of 1000
set timeoutlen=500
map <space> \

" vim-specific
nnoremap <leader>v :so $MYVIMRC<cr>
nnoremap <leader>ve :tabedit $MYVIMRC<cr>

" don't use Ex mode, use Q for formatting
nnoremap Q gq

" navigate splits the way I like
nnoremap <leader>w <c-w>

" disable highligting
nnoremap <leader>h :noh<cr>

" tab navigation prev/next
nnoremap <c-n> gt
nnoremap <c-p> gT

" better vertical movement for wrapped lines
" does not play nicely with relativenumber
" nnoremap j gj
" nnoremap k gk

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

nnoremap <silent> K :call <SID>show_documentation()<cr>
" }}}

" }}}1
" {{{1 Functions


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
"ndfunction

" }}}1

if &rtp =~ 'nord'
  colorscheme nord
endif
